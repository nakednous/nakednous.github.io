---
layout: post
title: "Dandelion matrices handling"
date: 2013-11-23 14:55:28 -0500
comments: true
categories: dandelion, proscene
author: Jean Pierre Charalambos
published: false
---

Any third party framework willing to use 
[Dandelion](https://github.com/remixlab/dandelion) should at least:

1. Implement visual hints, such as the displaying of the axes and the grid.
2. Define how transformation matrices should be handled.

This post describe how these two tasks are carried out in ProScene2, allowing
Processing to take full advantage of the Dandelion framework.

# Visual hints in Proscene2

All Dandelion visual hints are defined by the VisualHintable interface. Since 
some of the ProScene2 splits the implementation 

provides P5Drawing2D P5Drawing3D

# Transformations matrices

Connect dandelion to other framworks such as Processing.

#Approach

#Examples

1. Java2D
2. Target application has its own matrix stack
2. Target application misses matrix stack
