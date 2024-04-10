/*
 * reactor.h
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

#ifndef REACTOR_H
#define REACTOR_H

#include "component.h"
#include "energy_container.h"
#include "energy_consumer.h"
#include "resource/resource.h"

class EnergyManager;

class Reactor: public Component, public EnergyConsumer
{
    Resource<double> capacity;          // Capacity per second
    const double simulation_atom_var;   // Atom definition. typically 0.1 second
    double atom_capacity;               // Capacity per atom

    EnergyContainer *energy;
    EnergyContainer *ftl_energy;

public:
    Reactor();
    Reactor(double capacity, // How much energy does the reactor generate
                 EnergyContainer *energy,
                 EnergyContainer *ftl_energy,
                 double simulation_atom_var);


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

    void Generate();
    double Capacity() const;
    double MaxCapacity() const;
};

#endif // REACTOR_H
