/*
 * energy_types.h
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

#ifndef ENERGYTYPES_H
#define ENERGYTYPES_H

#include <string>

/* Discussion of FTL - yes, it isn't really faster. However, 
* it would be easier for a new developer or someone from WC
* to figure what it means.
*/
enum class EnergyType {
    Fuel,   // 1
    Energy, // 0 Capacitor
    FTL,   // 2 FTL
    None    // 3 Free Energy
};

EnergyType SaveToType(const int type);

std::string TypeToSave(EnergyType type);


enum class EnergyConsumerClassification {
    // Fuel
    Reactor, 
    Drive,
    Afterburner,
    
    // Energy
    LifeSupport, 
    Radar,
    Shield,
    ECM,
    Cloak,
    BallWeapon,
    BeamWeapon,
    BoltWeapon, 

    // SPEC
    SPECDrive,
    JumpDrive
};

enum class EnergyConsumerType {
    Constant,   // Life Support, Radar, etc.
    Variable,   // Beam Weapons, Afterburner
    Momentary   // Ball/Bolt Weapons, Jump Drive
};


#endif // ENERGYTYPES_H