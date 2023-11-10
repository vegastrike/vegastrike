/*
 * component.h
 *
 * Copyright (c) 2001-2002 Daniel Horn
 * Copyright (c) 2002-2019 pyramid3d and other Vega Strike Contributors
 * Copyright (c) 2019-2023 Stephen G. Tuggy, Benjamen R. Meyer, Roy Falk and other Vega Strike Contributors
 *
 * https://github.com/vegastrike/Vega-Strike-Engine-Source
 *
 * This file is part of Vega Strike.
 *
 * Vega Strike is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * Vega Strike is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Vega Strike. If not, see <https://www.gnu.org/licenses/>.
 */

// -*- mode: c++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#ifndef COMPONENT_H
#define COMPONENT_H


class Component
{
protected:
    bool installed = true;
    bool enabled = true;
    bool damaged = false;
public:
    Component();
    virtual ~Component() {}

    void Install() { installed = true; }
    void Uninstall() { installed = false; }
    bool Installed() { return installed; }

    void Enable() { enabled = true; }
    void Disable() { enabled = false; }
    bool Enabled() { return enabled; }


    //virtual void damage();
    //virtual void fix();


};

// These functions reduce functionality by a uniform distribution 0-1.
// The function name's number component is the chance of the damage occurring.
double random20();

#endif // COMPONENT_H
