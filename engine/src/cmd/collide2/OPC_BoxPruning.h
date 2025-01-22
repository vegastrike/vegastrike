///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 *      OPCODE - Optimized Collision Detection
 *      Copyright (C) 2001 Pierre Terdiman
 *      Copyright (C) 2021, 2022, 2025 Stephen G. Tuggy
 *      Copyright (C) 2023 Benjamen R. Meyer
 *      Public Domain
 *      Homepage: http://www.codercorner.com/Opcode.htm
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *      Contains code for box pruning.
 *      \file		IceBoxPruning.h
 *      \author		Pierre Terdiman
 *      \date		January, 29, 2000
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Include Guard
#ifndef VEGA_STRIKE_ENGINE_CMD_COLLSION2_OPC_BOXPRUNING_H
#define VEGA_STRIKE_ENGINE_CMD_COLLSION2_OPC_BOXPRUNING_H

// Optimized versions
FUNCTION OPCODE_API bool CompleteBoxPruning(uint32_t nb, const AABB **array, Pairs &pairs, const Axes &axes);
FUNCTION OPCODE_API bool BipartiteBoxPruning(uint32_t nb0,
        const AABB **array0,
        uint32_t nb1,
        const AABB **array1,
        Pairs &pairs,
        const Axes &axes);

// Brute-force versions
FUNCTION OPCODE_API bool BruteForceCompleteBoxTest(uint32_t nb, const AABB **array, Pairs &pairs);
FUNCTION OPCODE_API bool BruteForceBipartiteBoxTest(uint32_t nb0,
        const AABB **array0,
        uint32_t nb1,
        const AABB **array1,
        Pairs &pairs);

#endif //VEGA_STRIKE_ENGINE_CMD_COLLSION2_OPC_BOXPRUNING_H
