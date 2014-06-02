---
layout: post
title: "Proscene v2.0.0 Released"
date: 2014-05-31 18:28:06 -0500
comments: true
categories: proscene dandelion bias fpstiming
---

**Proscene v2.0.0** is out. Being a stable release, it should now be possible to import it directly from your PDE. Otherwise download it [here](https://github.com/remixlab/proscene/releases/download/v-2.0.0/proscene-2.0.0.zip) 
and extract it to your sketchbook `libraries` folder.

The library aims at providing interactivity to [Frames](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Frame.html)
(coordinate systems) allowing picking and motion control of objects, including the
[Eye](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Eye.html), which in 3D is referred to as the
[Camera](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Camera.html).
Version 2 introduces a new library design supporting all the features found in version 1 plus some others.
Perhaps the three key new features are:

1. Cross-platform support: the new library architecture separates the core functionalities from the language/platform where target
applications are to be run. **ProScene** may be regarded just as an interface between that core and **Processing**.
Details may be found [here](http://nakednous.github.io/projects/proscene/). The `Demos.MatrixShader` example shows a taste of it.
2. Support to all sorts of interaction mechanisms, including the standard mouse and keyboard, but not being particularly tie
to any of them. i.e., it's *device agnostic* by design. The examples of the `Input` section illustrate the approach.
3. Support for 2D as well as 3D Processing renderers. Many of the examples are available in both cases.

Combined, features 1. and 2., represent the foundation to implement a wide range of setups ranging from simple to very complex ones.
For instance, we already began a **ProScene** Android port, which is currently taken place at its own
[fork](https://github.com/remixlab/proscene.droid). We hope to integrate it back upstream once _TouchEvents_ are directly
supported in **Processing**. We also plan a first release of the Android port soon, so please stay tuned. In the mean time, have a look
at the `examples.Demos.Android2DOF`,`examples.Demos.Android3DOF` which only require the Android-mode of **Processing** to run. We also
implemented a **kinect** interface to control the camera on top of that foundation. The demo may be found at `examples.Demos.Kinect5DOF`
and the gestures implemented to control the camera [here](https://www.youtube.com/watch?v=G8SEzFMmMyI). Finally, we hope that the
Version 2 cycle will see the first **Java-Script** port taking the most out of our approach.

This release also includes additional examples illustrating most of the new features. We are confident that a _learn-by-example_ methodology
is the main (and most entertained) way to get use to them. The [API](http://otrolado.info/prosceneApi/) has also been thoroughly reviewed
and fully documented.

Happy hacking!

# Acknowledgments

Thanks to [Eduardo Moriana](http://edumo.net/) and [Miguel Parra](http://maparrar.github.io/) for their contributions with the [TUIO](http://www.tuio.org/)-based touch and kinect interfaces, respectively.
Thanks to experimental computational designer [Amnon Owed](https://twitter.com/AmnonOwed/media) for his collaboration with polishing the KeyFrameInterpolator sub-system.
Thanks to [Jacques Maire](http://www.xelyx.fr) for providing most of the examples found at the *contrib* section. Thansk to [Andres Colubri](http://codeanticode.wordpress.com/) for his continuous support and thorough insights.
Thanks to [Victor Forero](https://sites.google.com/site/proscenedroi/home) who is developing the [proscene Android port](https://github.com/remixlab/proscene.droid).
Thanks also to all **ProScene** users whose sketchs and library hacks always amaze us and inspire us.
