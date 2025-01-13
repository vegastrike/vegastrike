/*
 * IceMatrix4x4.cpp
 *
 * Vega Strike - Space Simulation, Combat and Trading
 * Copyright (C) 2001-2025 The Vega Strike Contributors:
 * Creator: Daniel Horn
 * Original development team: As listed in the AUTHORS file
 * Current development team: Roy Falk, Benjamen R. Meyer, Stephen G. Tuggy
 *
 *
 * https://github.com/vegastrike/Vega-Strike-Engine-Source
 *
 * This file is part of Vega Strike.
 *
 * Vega Strike is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Vega Strike is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Vega Strike.  If not, see <https://www.gnu.org/licenses/>.
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	Contains code for 4x4 matrices.
 *	\file		IceMatrix4x4.cpp
 *	\author		Pierre Terdiman
 *	\date		April, 4, 2000
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	4x4 matrix.
 *	DirectX-compliant, ie row-column order, ie m[Row][Col].
 *	Same as:
 *	m11  m12  m13  m14	first row.
 *	m21  m22  m23  m24	second row.
 *	m31  m32  m33  m34	third row.
 *	m41  m42  m43  m44	fourth row.
 *	Translation is (m41, m42, m43), (m14, m24, m34, m44) = (0, 0, 0, 1).
 *	Stored in memory as m11 m12 m13 m14 m21...
 *
 *	Multiplication rules:
 *
 *	[x'y'z'1] = [xyz1][M]
 *
 *	x' = x*m11 + y*m21 + z*m31 + m41
 *	y' = x*m12 + y*m22 + z*m32 + m42
 *	z' = x*m13 + y*m23 + z*m33 + m43
 *	1' =     0 +     0 +     0 + m44
 *
 *	\class		Matrix4x4
 *	\author		Pierre Terdiman
 *	\version	1.0
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * Updated by Stephen G. Tuggy 2021-07-03
 * Updated by Stephen G. Tuggy 2022-01-06
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Precompiled Header
#include "Stdafx.h"

using namespace Opcode;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	Inverts a PR matrix. (which only contains a rotation and a translation)
 *	This is faster and less subject to FPU errors than the generic inversion code.
 *
 *	\relates	Matrix4x4
 *	\fn			InvertPRMatrix(Matrix4x4& dest, const Matrix4x4& src)
 *	\param		dest	[out] destination matrix
 *	\param		src		[in] source matrix
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void Opcode::InvertPRMatrix(Matrix4x4 &dest, const Matrix4x4 &src) {
    dest.m[0][0] = src.m[0][0];
    dest.m[1][0] = src.m[0][1];
    dest.m[2][0] = src.m[0][2];
    dest.m[3][0] = -(src.m[3][0] * src.m[0][0] + src.m[3][1] * src.m[0][1] + src.m[3][2] * src.m[0][2]);

    dest.m[0][1] = src.m[1][0];
    dest.m[1][1] = src.m[1][1];
    dest.m[2][1] = src.m[1][2];
    dest.m[3][1] = -(src.m[3][0] * src.m[1][0] + src.m[3][1] * src.m[1][1] + src.m[3][2] * src.m[1][2]);

    dest.m[0][2] = src.m[2][0];
    dest.m[1][2] = src.m[2][1];
    dest.m[2][2] = src.m[2][2];
    dest.m[3][2] = -(src.m[3][0] * src.m[2][0] + src.m[3][1] * src.m[2][1] + src.m[3][2] * src.m[2][2]);

    dest.m[0][3] = 0.0f;
    dest.m[1][3] = 0.0f;
    dest.m[2][3] = 0.0f;
    dest.m[3][3] = 1.0f;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Compute the cofactor of the Matrix at a specified location
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
float Matrix4x4::CoFactor(uint32_t row, uint32_t col) const {
    return ((m[(row + 1) & 3][(col + 1) & 3] * m[(row + 2) & 3][(col + 2) & 3] * m[(row + 3) & 3][(col + 3) & 3] +
            m[(row + 1) & 3][(col + 2) & 3] * m[(row + 2) & 3][(col + 3) & 3] * m[(row + 3) & 3][(col + 1) & 3] +
            m[(row + 1) & 3][(col + 3) & 3] * m[(row + 2) & 3][(col + 1) & 3] * m[(row + 3) & 3][(col + 2) & 3])
            - (m[(row + 3) & 3][(col + 1) & 3] * m[(row + 2) & 3][(col + 2) & 3] * m[(row + 1) & 3][(col + 3) & 3] +
                    m[(row + 3) & 3][(col + 2) & 3] * m[(row + 2) & 3][(col + 3) & 3] * m[(row + 1) & 3][(col + 1) & 3]
                    +
                            m[(row + 3) & 3][(col + 3) & 3] * m[(row + 2) & 3][(col + 1) & 3]
                                    * m[(row + 1) & 3][(col + 2) & 3])) * ((row + col) & 1 ? -1.0f : +1.0f);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Compute the determinant of the Matrix
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
float Matrix4x4::Determinant() const {
    return m[0][0] * CoFactor(0, 0) +
            m[0][1] * CoFactor(0, 1) +
            m[0][2] * CoFactor(0, 2) +
            m[0][3] * CoFactor(0, 3);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Compute the inverse of the matrix
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Matrix4x4 &Matrix4x4::Invert() {
    float Det = Determinant();
    Matrix4x4 Temp;

    if (fabsf(Det) < MATRIX4X4_EPSILON) {
        return *this;
    }        // The matrix is not invertible! Singular case!

    float IDet = 1.0f / Det;

    Temp.m[0][0] = CoFactor(0, 0) * IDet;
    Temp.m[1][0] = CoFactor(0, 1) * IDet;
    Temp.m[2][0] = CoFactor(0, 2) * IDet;
    Temp.m[3][0] = CoFactor(0, 3) * IDet;
    Temp.m[0][1] = CoFactor(1, 0) * IDet;
    Temp.m[1][1] = CoFactor(1, 1) * IDet;
    Temp.m[2][1] = CoFactor(1, 2) * IDet;
    Temp.m[3][1] = CoFactor(1, 3) * IDet;
    Temp.m[0][2] = CoFactor(2, 0) * IDet;
    Temp.m[1][2] = CoFactor(2, 1) * IDet;
    Temp.m[2][2] = CoFactor(2, 2) * IDet;
    Temp.m[3][2] = CoFactor(2, 3) * IDet;
    Temp.m[0][3] = CoFactor(3, 0) * IDet;
    Temp.m[1][3] = CoFactor(3, 1) * IDet;
    Temp.m[2][3] = CoFactor(3, 2) * IDet;
    Temp.m[3][3] = CoFactor(3, 3) * IDet;

    *this = Temp;

    return *this;
}

