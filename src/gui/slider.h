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

#ifndef __SLIDER_H__
#define __SLIDER_H__

#include "gui/groupcontrol.h"

// See cpp file for detailed descriptions of classes, functions, etc.

// The Slider class controls the setting for a simple integer range.

class Slider : public Control
{
public:
    // Range represented by the slider.
    void setMaxMin(int max, int min = 0);

    // "Thumb" length.  1.0 = Entire range.
    void setThumbLength(float len);

    // Set size of a "page" - used when clicked outside the thumb.
    void setPageSize(int s) { m_pageSize = s; };

    // Position.
    // This is some value between min and max.
    int position(void) { return m_position; };
    void setPosition(int pos);

    // Color of thumb.
    void setThumbColor(const GFXColor& color, const GFXColor& outline = GUI_OPAQUE_BLACK)
        { m_thumbColor = color; m_thumbOutlineColor = outline; };

    // OVERRIDES

    virtual bool draw(void);
    virtual void setRect(const Rect& r);
    virtual void setColor(const GFXColor& c);

    virtual bool processMouseDown(const InputEvent& event);
    virtual bool processMouseUp(const InputEvent& event);
    virtual bool processMouseDrag(const InputEvent& event);

    // CONSTRUCTION
public:
    Slider(void);
    virtual ~Slider(void) {};

protected:
    // INTERNAL IMPLEMENTATION

    // Mouse states
    enum MouseState {
        MOUSE_NONE,         // Nothing interesting going on.
        MOUSE_PAGE_UP,      // In the middle of a Page Up click.
        MOUSE_PAGE_DOWN,    // In the middle of a Page Down click.
        MOUSE_THUMB_DRAG    // In the middle of dragging the thumb.
    };

    // VARIABLES
protected:
    int m_minValue;         // The minimum value in the scrolling range.
    int m_maxValue;         // The maximum value in the scrolling range.
    float m_thumbLength;    // The size of the thumb relative to height/width of slider.
    float m_originalThumbLength;//Original setting for thumb length.
    int m_pageSize;         // The number of units in a "page".
    GFXColor m_thumbColor;  // Color to paint the thumb.
    GFXColor m_thumbOutlineColor;//Color of outline for thumb.

    int m_position;         // The current position.
    bool m_vertical;        // True = Vertical, false = horizontal.
    MouseState m_mouseState;// Which state we are in while the mouse button is pressed.
    float m_buttonDownMouse;// Location where the mouse button was pressed down.
    int m_buttonDownPosition;// Position of slider when mouse button was pressed down.
    Rect m_thumbRect;       // Remembered position of the thumb.
};

#endif   // __SLIDER_H__
