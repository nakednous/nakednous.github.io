---
layout: post
title: "Proscene v2.0.0-alpha1 released"
date: 2013-10-26 15:23
comments: true
categories: proscene dandelion bias fpstiming
---

Today I'm releasing the first alpha of what will hopefully become *proscene2*. For the impatient, [download it](https://github.com/remixlab/proscene/releases/download/v-2.0.0-alpha.1/proscene-2.0.0-alpha.1.zip) and extract it to your sketchbook `libraries` folder (automatic importing *proscene* from your PDE is only available for stable releases, currently v-1.2.0). Even though the library has almost been completely rewritten from the ground up, you will find most of the current examples with some minor changes, plus a whole bunch of new ones. There's also a new project [home](http://otrolado.info/) and its code is now kindly hosted at [github](https://github.com/remixlab). Read on for some more details.

## Motivation

Some years ago *Proscene* was firstly designed to ease interactivity of 3D *Processing* scenes through standard input devices: mouse and keyboard. Then at some point when we noticed that some of you guys were interacting within your sketches using "non-standard" Human Interface Devices (HIDs), we decided to add some basic support to them, but the code never really makes it to *Proscene's* core: the `iFrame` class hierarchy. The reason for that being that `iFrames` and (standard) input events were tightly coupled. Our first *Proscene* design also lacked providing means to interact using a touch device, mainly because back in 2010 when it was first released, there wasn't a Processing "android mode". On the other hand, as with any other *Processing* library, publishing a sketch online was a matter of exporting it as a java applet. However, this is no longer the case and, as most of you probably know, Java-Script (JS) has almost ended up replacing java applets in *Processing2*.

## Challenges for the Proscene2 cycle

1. Add 2D `Scene` mode (e.g., `size(640, 360, P2D); scene = new Scene(this);`). Yes, it's not part of the above motivation, but that would be cool ;)
2. Allow adding a new HID to interact with a 2D or 3D scene as simple as possible, without hindering the customization flexibility as it is found with standard devices.
3. Support other *Processing* modes such as JS and/or Android.

and while it has been progress for the third challenge, this release only covers the first two of them.

## Approach

1. 2D interactivity required `scaling` to be added to `iFrames` which are now defined by their `position`, `orientation` and (now) `scaling`. As a result, moving the viewpoint around, picking and manipulating objects, adding keyframes to a camera path, etc., are all now possible in 2D too.
1. We completely decoupled the handling of HIDs from the set of _actions_ (all sorts of `iFrame` manipulations) supported by *Proscene*, by defining a set of _virtual events_ (called `TerseEvents`) which represents an interface between them. An important `TerseEvent` specialization is a `MotionEvent` which is defined according to its degrees-of-freedom ([DOFs](http://en.wikipedia.org/wiki/Degrees_of_freedom_(mechanics))), making it particularly suitable to applications requiring all sorts of kinematics computations, such as those involved in `iFrame` manipulations. Adding an HID thus "_only_" requires reducing hardware input events to `MotionEvents`, from which all *Proscene* actions are now implemented.

Expect more technical details regarding *Proscene2* and its new package structure with the next pre-releases.

## Current status: why we call it *alpha.1*?

1. JS mode: work-in-progress.
2. Examples documentation: mostly missing. However all the examples seem to run fine here ([archlinux](https://www.archlinux.org/) and *Processing-2.1b1*).
2. API docs: broken and incomplete.
1. Advanced examples need more polishing.

This release is mainly aimed at testers and enthusiasts that wanna try the new features from perfectly well undocumented examples ;)

## Acknowledgements

Thanks to  [Eduardo Moriana](http://edumo.net/) and [Miguel Parra](http://maparrar.github.io/) for their contributions with the [TUIO](http://www.tuio.org/)-based touch and kinect interfaces, respectively.
