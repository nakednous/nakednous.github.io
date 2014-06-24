---
layout: post
title: "Proscene v2.0.1 Released"
date: 2014-06-23 19:48:27 -0500
comments: true
categories: proscene dandelion bias fpstiming
---

**Proscene v2.0.1** is out. It should be possible to import it directly from your PDE. Otherwise download it [here](https://github.com/remixlab/proscene/releases/download/v-2.0.1/proscene-2.0.1.zip) 
and extract it to your sketchbook `libraries` folder.

# Changelog

1. API changes
   1. `remixlab.dandelion.core.Constants.WheelAction` has been renamed as `remixlab.dandelion.core.Constants.DOF1Action`. The former has been marked as deprecated. The change should be reflected in all _scene mouse wheel_ methods.
   2. `remixlab.bias.core.EventConstants` has been removed. Modifier constant values have been moved to `remixlab.bias.core.BogusEvent`. Use `PApplet.LEFT`, `PApplet.CENTER` and `PApplet.RIGHT` to refer to mouse buttons.
2. New example `Frame.FrameAPI` added. The example illustrates the powerful Frame API used to convert points and vectors along a frame hierarchy.