/*
 * reactor.cpp
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

#include "reactor.h"

#include "unit_csv_factory.h"

#include <iostream>

const std::string REACTOR_RECHARGE = "Reactor_Recharge";



Reactor::Reactor(EnergyContainer *source,
                 EnergyContainer *energy,
                 EnergyContainer *ftl_energy,
                 double conversion_ratio): 
                 Component("", 0.0, 0.0, false),
                 EnergyConsumer(source, false),
                 capacity(0.0, 0.0, 0.0),
                 atom_capacity(0.0),
                 conversion_ratio(conversion_ratio),
                 energy(energy),
                 ftl_energy(ftl_energy) {
}


void Reactor::Load(std::string upgrade_key, std::string unit_key) {
    capacity = UnitCSVFactory::GetVariable(unit_key, REACTOR_RECHARGE, 0.0f);
    atom_capacity = capacity * simulation_atom_var;
    SetConsumption(capacity * conversion_ratio);
}     
    
void Reactor::SaveToCSV(std::map<std::string, std::string>& unit) const {
    // TODO: This won't record damage to recharge
    unit[REACTOR_RECHARGE] = std::to_string(capacity.MaxValue());
}

std::string Reactor::Describe() const {
    return std::string();
}

bool Reactor::CanDowngrade() const {
    return !Damaged();
}

bool Reactor::Downgrade() {
    if(!CanDowngrade()) {
        return false;
    }
    
    capacity.SetMaxValue(0.0);
    atom_capacity = 0.0;
    SetConsumption(0.0);

    return true;
}

bool Reactor::CanUpgrade(const std::string upgrade_name) const {
    return !Damaged();
}

bool Reactor::Upgrade(const std::string upgrade_name) {
    if(!CanUpgrade(upgrade_key)) {
        return false;
    }

    this->upgrade_key = upgrade_key;
    this->upgrade_name = upgrade_name;

    capacity = UnitCSVFactory::GetVariable(upgrade_name, REACTOR_RECHARGE, 0.0f);
    atom_capacity = capacity * simulation_atom_var;
    SetConsumption(capacity * conversion_ratio);

    return true;
}

void Reactor::Damage() {
    capacity.RandomDamage();
    atom_capacity = capacity.Value() * simulation_atom_var;
}

void Reactor::Repair() {
    capacity.RepairFully();
    atom_capacity = capacity.Value() * simulation_atom_var;
}

bool Reactor::Damaged() const {
    return capacity.Damaged();
}

bool Reactor::Installed() const {
    return capacity.MaxValue() > 0;
}

void Reactor::Generate() {
    double power = Consume();

    // Zero out fuel if power is 0
    if(power < 0.0001) {
        ZeroSource();
        return;
    }
    
    double surplus = energy->Charge(atom_capacity * power);
    surplus = ftl_energy->Charge(atom_capacity * surplus);
}

double Reactor::Capacity() const {
    return capacity.Value();
}
    
double Reactor::MaxCapacity() const {
    return capacity.MaxValue();
}

void Reactor::SetCapacity(double capacity) {
    this->capacity.SetMaxValue(capacity);
    atom_capacity = capacity * simulation_atom_var;
    SetConsumption(capacity * conversion_ratio);
}