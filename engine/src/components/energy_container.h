/*
 * energy_container.h
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

#ifndef ENERGYCONTAINER_H
#define ENERGYCONTAINER_H

#include <vector>
#include <iostream>

#include "resource/resource.h"
#include "component.h"

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


/**
 * @brief The EnergyContainer class models the fuel cell, capacitor and SPEC capacitor
 */
class EnergyContainer: public Component
{
    EnergyType type;
    Resource<double> level;

public:
    EnergyContainer(EnergyType type);

    // Return value - any surplus charge
    double Charge(const double quantity);

    // Partial - can power consumer with less energy than requested
    double Deplete(bool partial, const double quantity);
    bool Depleted() const;

    void SetCapacity(const double capacity, bool refill = true);
    double Level() const;
    double MaxLevel() const;
    double Percent() const;
    void Refill();

    void Zero();

    /*void Use(EnergyConsumerClassification classification);

    bool InUse(EnergyConsumerClassification classification);
    double Powered(EnergyConsumerClassification classification);*/

    // Component
    virtual void Load(std::string upgrade_key, std::string unit_key);      
    
    virtual void SaveToCSV(std::map<std::string, std::string>& unit) const;

    virtual std::string Describe() const; // Describe component in base_computer 

    virtual bool CanDowngrade() const;

    virtual bool Downgrade();

    virtual bool CanUpgrade(const std::string upgrade_name) const;

    virtual bool Upgrade(const std::string upgrade_name);

    virtual void Damage();
    virtual void Repair();

    virtual bool Damaged() const;
    virtual bool Installed() const;
};

#endif // ENERGYCONTAINER_H
