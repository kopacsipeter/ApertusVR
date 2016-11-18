//-----------------------------------------------------------------------------
// Program Type: Vertex shader
// Language: hlsl
// Created by Ogre RT Shader Generator. All rights reserved.
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//                         PROGRAM DEPENDENCIES
//-----------------------------------------------------------------------------
#include "FFPLib_Transform.hlsl"
#include "FFPLib_Common.hlsl"
#include "SGXLib_PerPixelLighting.hlsl"
#include "FFPLib_Texturing.hlsl"

//-----------------------------------------------------------------------------
//                         GLOBAL PARAMETERS
//-----------------------------------------------------------------------------

float4x4	worldviewproj_matrix;
float4x4	inverse_transpose_worldview_matrix;

//-----------------------------------------------------------------------------
// Function Name: main
// Function Desc: Vertex Program Entry point
//-----------------------------------------------------------------------------
void main
	(
	 in float4	iPos_0 : POSITION, 
	 in float4	iColor_0 : COLOR, 
	 in float3	iNormal_0 : NORMAL, 
	 in float2	iTexcoord2_0 : TEXCOORD0, 
	 out float4	oPos_0 : SV_Position, 
	 out float4	oColor_0 : COLOR, 
	 out float3	oTexcoord3_0 : TEXCOORD0, 
	 out float2	oTexcoord2_1 : TEXCOORD1
	)
{
	float4	lLocalParam_0;

	FFP_Transform(worldviewproj_matrix, iPos_0, oPos_0);

	FFP_Assign(iColor_0, oColor_0);

	FFP_Construct(0.0, 0.0, 0.0, 0.0, lLocalParam_0);

	SGX_TransformNormal(inverse_transpose_worldview_matrix, iNormal_0, oTexcoord3_0);

	FFP_Assign(iTexcoord2_0, oTexcoord2_1);
}
