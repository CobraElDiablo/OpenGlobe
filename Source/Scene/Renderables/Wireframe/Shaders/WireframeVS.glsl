﻿#version 330
//
// (C) Copyright 2010 Patrick Cozzi and Deron Ohlarik
//
// Distributed under the Boost Software License, Version 1.0.
// See License.txt or http://www.boost.org/LICENSE_1_0.txt.
//

in vec4 position;
out vec2 windowPosition;
uniform mat4 og_modelViewPerspectiveProjectionMatrix;
uniform mat4 og_viewportTransformationMatrix;

vec4 ClipToWindowCoordinates(vec4 v, mat4 viewportTransformationMatrix)
{
    v.xyz /= v.w;                                                  // normalized device coordinates
    v.xyz = (viewportTransformationMatrix * vec4(v.xyz, 1.0)).xyz; // windows coordinates
    return v;
}

void main()                     
{
    gl_Position = og_modelViewPerspectiveProjectionMatrix * position;
    windowPosition = ClipToWindowCoordinates(gl_Position, og_viewportTransformationMatrix).xy;
}