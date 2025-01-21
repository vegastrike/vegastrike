///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 *  OPCODE - Optimized Collision Detection
 *  Copyright (C) 2001 Pierre Terdiman
 *  Copyright (C) 2025 Stephen G. Tuggy
 *  Public Domain
 *  Homepage: http://www.codercorner.com/Opcode.htm
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *  Contains common classes & defs used in OPCODE.
 *  \file		OPC_Common.cpp
 *  \author		Pierre Terdiman
 *  \date		March, 20, 2001
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *  An AABB dedicated to collision detection.
 *  We don't use the generic AABB class included in ICE, since it can be a Min/Max or a Center/Extents one (depends
 *  on compilation flags). Since the Center/Extents model is more efficient in collision detection, it was worth
 *  using an extra special class.
 *
 *  \class		CollisionAABB
 *  \author		Pierre Terdiman
 *	\version	1.3
 *	\date		March, 20, 2001
*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	A quantized AABB.
 *	Center/Extent model, using 16-bits integers.
 *
 *	\class		QuantizedAABB
 *	\author		Pierre Terdiman
 *	\version	1.3
 *	\date		March, 20, 2001
*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Precompiled Header
#include "Stdafx.h"
