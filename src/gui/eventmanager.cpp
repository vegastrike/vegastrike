/* 
 * Vega Strike
 * Copyright (C) 2003 Mike Byron
 * 
 * http://vegastrike.sourceforge.net/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#include "vegastrike.h"

#include "eventmanager.h"

using namespace std;

/* The EventManager class contains the basic event loop and the code
 * to support the EventResponder chain.  There should be only one
 * instance of this class running in an application.
 * You can get a pointer to it by using the static globalEventManager()
 * function.
 */

// This is the one, unique event manager.
static EventManager* globalEventManagerPtr = NULL;

// STATIC: Get the global instance of the event manager
EventManager& globalEventManager(void) {
    if(globalEventManagerPtr == NULL) {
        EventManager::initializeEventManager();
        assert(globalEventManagerPtr != NULL);  // Make sure we got a manager!
    }
    
    return *globalEventManagerPtr;
}


// STATIC: Initialize the event manager.  This starts the event loop, etc.
// This may be called more than once -- it does nothing after the
//  first call.
void EventManager::initializeEventManager(void) {
    globalEventManagerPtr = new EventManager();
    globalEventManagerPtr->takeOverEventManagement();              // FIXME -- EVENT HACK
}


// Add a new event responder to the top of the chain.
// This responder will get events *first*.
void EventManager::pushResponder(EventResponder* responder) {
    m_responders.push_back(responder);
}

// Remove an event responder from the chain.
void EventManager::removeResponder(
    EventResponder* responder,          // The responder to get rid of.
    bool top                            // True = only topmost, False = all.
    ) {

    bool found;                 // Whether we found one
    do {
        found = false;
        // Start at the top, so that we only get the top if we only want the top.
        // Can't use reverse_iterator easily -- erase() needs iterator.
        for(int i = m_responders.size()-1 ; i >= 0 ; i-- ) {
            if(m_responders[i] == responder) {
                m_responders.erase(m_responders.begin()+i);
                found = true;
                break;
            }
        }
        // Do the loop again if we found one and we want all of them.
    } while(found && !top);

    checkForShutDownEventManager();     // FIXME mbyron -- EVENT HACK.
}

// Send a command through the responder chain.
void EventManager::sendCommand(const EventCommandId& id, Control* control) {
    vector <EventResponder*>::reverse_iterator iter;

    // Loop through the event chain, starting at the end.
    for(iter = m_responders.rbegin() ; iter != m_responders.rend() ; iter++ ) {
        if((*iter)->processCommand(id, control)) {
            // Somebody handled it!
            break;
        }
    }
}

// Send an input event through the responder chain.
void EventManager::sendInputEvent(const InputEvent& event) {
   vector <EventResponder*>::reverse_iterator iter;

   // Record the mouse position.
   // This is used (at least) to render the cursor.
   switch(event.type) {
        case MOUSE_DOWN_EVENT:
        case MOUSE_UP_EVENT:
        case MOUSE_MOVE_EVENT:
        case MOUSE_DRAG_EVENT:
            m_mouseLoc = event.loc;
            break;
   }

   // Loop through the event chain, starting at the end.
    for(iter = m_responders.rbegin() ; iter != m_responders.rend() ; iter++ ) {
        bool result = false;
        switch(event.type) {
            case KEY_DOWN_EVENT:
                result = (*iter)->processKeyDown(event);
                break;
            case KEY_UP_EVENT:
                result = (*iter)->processKeyUp(event);
                break;
            case MOUSE_DOWN_EVENT:
                result = (*iter)->processMouseDown(event);
                break;
            case MOUSE_UP_EVENT:
                result = (*iter)->processMouseUp(event);
                break;
            case MOUSE_MOVE_EVENT:
                result = (*iter)->processMouseMove(event);
                break;
            case MOUSE_DRAG_EVENT:
                result = (*iter)->processMouseDrag(event);
                break;
            default:
                // Event responder dispatch doesn't handle this type of input event!
                assert(false);
                break;
        }

        if(result) {
            // Somebody handled it!
            break;
        }
    }
}

// Constructor isn't public.  Use initializeEventManager.
EventManager::EventManager(void)
:
    m_mouseLoc(0.0, 0.0)
{
}

// Destructor.
EventManager::~EventManager(void) {
}



///////////// HACKS FOR WORKING WITH CURRENT EVENT SYSTEM  //////////////////
#include "cmd/base.h"
#include "gldrv/winsys.h"


// Called to revert to old event management.
void EventManager::checkForShutDownEventManager(void) {
    if(m_responders.empty()) {
        // There are no more responders.  We assume no more of our windows, and reset mouse callbacks.
        BaseInterface::CurrentBase->InitCallbacks();

        // Get rid of global event manager object until we need it again.
        delete globalEventManagerPtr;
        globalEventManagerPtr = NULL;
    }
}

// Map mouse coord to Vegastrike 2d coord.
static float MouseXTo2dX(int x) {
    // 2*(coord+.5)/res + 1.
    // Puts origin in the middle of the screen, going -1 -> 1 left to right.
    // Add .5 to put mouse in middle of pixel, rather than left side.
    // Multiply by 2 first to reduce division error in the multiply.
    // Do everything in double to minimize calc error and because it's faster.
    // Result in float to round-off at the end.  Gets prettier numbers. :-)
    return( (2.0 * ((double)x + 0.5)) / g_game.x_resolution - 1.0 );
}
static float MouseYTo2dY(int y) {
    // See explanation of x.
    // This is a bit different from x because the mouse coords increase top-
    //  to-bottom, and the drawing surface y increases bottom-to-top.
    //  So we need to reflect the mouse coords around the y origin.
    return( 1.0 - (2.0 * ((double)y + 0.5)) / g_game.y_resolution );
}

void EventManager::ProcessMouseClick(int button, int state, int x, int y) {
    // Make sure we are working with the same "button" constants.
    assert( LEFT_MOUSE_BUTTON == WS_LEFT_BUTTON );
    assert( RIGHT_MOUSE_BUTTON == WS_RIGHT_BUTTON );
    assert( MIDDLE_MOUSE_BUTTON == WS_MIDDLE_BUTTON );

    if(state == WS_MOUSE_DOWN) {
        InputEvent event(MOUSE_DOWN_EVENT, button, 0, Point(MouseXTo2dX(x), MouseYTo2dY(y)));
        globalEventManager().sendInputEvent((event));
    } else {
        InputEvent event(MOUSE_UP_EVENT, button, 0, Point(MouseXTo2dX(x), MouseYTo2dY(y)));
        globalEventManager().sendInputEvent((event));
    }
}

void EventManager::ProcessMouseActive(int x, int y) {
    // FIXME mbyron -- Should provide info about which buttons are down.
    InputEvent event(MOUSE_DRAG_EVENT, 0, 0, Point(MouseXTo2dX(x), MouseYTo2dY(y)));
    globalEventManager().sendInputEvent((event));
}

void EventManager::ProcessMousePassive(int x, int y) {
    InputEvent event(MOUSE_MOVE_EVENT, 0, 0, Point(MouseXTo2dX(x), MouseYTo2dY(y)));
    globalEventManager().sendInputEvent((event));
}


// Called to grab event management from old system.
void EventManager::takeOverEventManagement(void) {
    winsys_set_mouse_func(EventManager::ProcessMouseClick);
    winsys_set_motion_func(EventManager::ProcessMouseActive);
    winsys_set_passive_motion_func(EventManager::ProcessMousePassive);
}
