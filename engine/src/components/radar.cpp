/*
 * radar.cpp
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

#include "radar.h"
#include "configuration/configuration.h"
#include "unit_csv_factory.h"
#include "components/component.h"

#define _USE_MATH_DEFINES
#include <math.h>


CRadar::CRadar():
        max_range(0),
        max_cone(-1),
        lock_cone(0),
        tracking_cone(0),
        min_target_size(0),
        type(RadarType::SPHERE),
        capabilities(RadarCapabilities::NONE),
        locked(false),
        can_lock(false),
        tracking_active(true) {
    max_range = configuration()->computer_config.default_max_range;
    tracking_cone = configuration()->computer_config.default_tracking_cone;
    lock_cone = configuration()->computer_config.default_lock_cone;
}

// Component Methods
void CRadar::Load(std::string unit_key) {
    Component::Load(unit_key);

    // Consumer
    double energy = UnitCSVFactory::GetVariable(unit_key, "Warp_Usage_Cost", 0.0f);
    SetConsumption(energy * configuration()->fuel.ftl_drive_factor);

    // Radar
    can_lock = UnitCSVFactory::GetVariable(unit_key, "Can_Lock", true);

    // TODO: fix this
    // The Radar_Color column in the units.csv has been changed from a
    // boolean value to a string. The boolean values are supported for
    // backwardscompatibility.
    // When we save this setting, it is simply converted from an integer
    // number to a string, and we need to support this as well.
    std::string iffval = UnitCSVFactory::GetVariable(unit_key, "Radar_Color", std::string());

    if ((iffval.empty()) || (iffval == "FALSE") || (iffval == "0")) {
        capabilities = RadarCapabilities::NONE;
    } else if ((iffval == "TRUE") || (iffval == "1")) {
        type = RadarType::SPHERE;
        capabilities = RadarCapabilities::FRIEND_FOE;
    } else if (iffval == "THREAT") {
        type = RadarType::SPHERE;
        capabilities = RadarCapabilities::FRIEND_FOE |
                RadarCapabilities::THREAT_ASSESSMENT;
    } else if (iffval == "BUBBLE_THREAT") {
        type = RadarType::BUBBLE;
        capabilities = RadarCapabilities::FRIEND_FOE |
                RadarCapabilities::OBJECT_RECOGNITION |
                RadarCapabilities::THREAT_ASSESSMENT;
    } else if (iffval == "PLANE") {
        type = RadarType::PLANE;
        capabilities = RadarCapabilities::FRIEND_FOE;
    } else if (iffval == "PLANE_THREAT") {
        type = RadarType::PLANE;
        capabilities = RadarCapabilities::FRIEND_FOE |
                RadarCapabilities::OBJECT_RECOGNITION |
                RadarCapabilities::THREAT_ASSESSMENT;
    } else {
        std::cout << "Try stoi " << unit_key << std::endl;
        unsigned int value = stoi(iffval, 0);
        std::cout << "Success stoi " << unit_key << std::endl;
        if (value == 0) {
            // Unknown value
            capabilities = RadarCapabilities::NONE;
        } else {
            capabilities = value;
        }
    }

    tracking_active = true;
    max_range = UnitCSVFactory::GetVariable(unit_key, "Radar_Range", 1000000);
    max_cone = cos(UnitCSVFactory::GetVariable(unit_key, "Max_Cone", 180.0) * M_PI / 180);
    tracking_cone = cos(UnitCSVFactory::GetVariable(unit_key, "Tracking_Cone", 180.0f) * M_PI / 180);
    lock_cone = cos(UnitCSVFactory::GetVariable(unit_key, "Lock_Cone", 180.0) * M_PI / 180);
}      

void CRadar::SaveToCSV(std::map<std::string, std::string>& unit) const {
    unit["Can_Lock"] = std::to_string(can_lock);
    unit["Radar_Color"] = std::to_string(capabilities);
    unit["Radar_Range"] = max_range.Serialize();

    // TODO: can't serialize if also doing acos on it
    const double modifier = M_PI / 180;
    unit["Tracking_Cone"] = std::to_string(acos(tracking_cone.Value()) * 180. / M_PI);
    unit["Max_Cone"] = std::to_string(acos(max_cone.Value()) * 180. / M_PI);
    unit["Lock_Cone"] = std::to_string(acos(lock_cone.Value()) * 180. / M_PI);
}

// FTL drive is integrated and so cannot be upgraded/downgraded
bool CRadar::CanDowngrade() const {
    return false;
}

bool CRadar::Downgrade() {
    return false;
}

bool CRadar::CanUpgrade(const std::string upgrade_key) const {
    return false;
}

bool CRadar::Upgrade(const std::string upgrade_key) {
    return false;
}

void CRadar::Damage() {
    max_range.RandomDamage();
    max_cone.RandomDamage();
    lock_cone.RandomDamage();
    tracking_cone.RandomDamage();

    // We calculate percent operational as a simple average
    operational = (max_range.Percent() + max_cone.Percent() + lock_cone.Percent() +
                  tracking_cone.Percent()) / 4 * 100;
}

void CRadar::DamageByPercent(double percent) {
    max_range.DamageByPercent(percent);
    max_cone.DamageByPercent(percent);
    lock_cone.DamageByPercent(percent);
    tracking_cone.DamageByPercent(percent);

    // We calculate percent operational as a simple average
    operational = (max_range.Percent() + max_cone.Percent() + lock_cone.Percent() +
                  tracking_cone.Percent()) / 4 * 100;
}

void CRadar::Repair() {
    max_range.RepairFully();
    max_cone.RepairFully();
    lock_cone.RepairFully();
    tracking_cone.RepairFully();

    operational.RepairFully();
}

void CRadar::Destroy() {
    max_range.Destroy();
    max_cone.Destroy();
    lock_cone.Destroy();
    tracking_cone.Destroy();

    operational = 0;

}


// Radar Code

// This code replaces and fixes the old code in Armed::LockTarget(bool)
void CRadar::Lock() {
    if(!can_lock) {
        this->locked = false;
        return;
    }

    // TODO: re-enable
    /*if(!UnitUtil::isSignificant(target)) {
        std::cerr << "Target insignificant\n";
        this->locked = false;
        return;
    }*/

    this->locked = true;
}

RadarType CRadar::GetType() const {
    return type;
}

bool CRadar::UseFriendFoe() const {
    return (capabilities & RadarCapabilities::FRIEND_FOE);
}

bool CRadar::UseObjectRecognition() const {
    return (capabilities & RadarCapabilities::OBJECT_RECOGNITION);
}

bool CRadar::UseThreatAssessment() const {
    return (capabilities & RadarCapabilities::THREAT_ASSESSMENT);
}

float CRadar::GetMaxRange() const { 
    return max_range.Value(); 
}

float CRadar::GetMaxCone() const { 
    return max_cone.Value(); 
}

float CRadar::GetLockCone() const { 
    return lock_cone.Value(); 
}

float CRadar::GetTrackingCone() const { 
    return tracking_cone.Value(); 
}

float CRadar::GetMinTargetSize() const { 
    return min_target_size; 
}

bool CRadar::Locked() const { 
    return locked; 
}

bool CRadar::CanLock() const { 
    return can_lock; 
}

bool CRadar::Tracking() const { 
    return tracking_active; 
}