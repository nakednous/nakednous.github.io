---
layout: post
title: "Proscene v2.0.0 Released"
date: 2014-05-31 18:28:06 -0500
comments: true
categories: 
---

**Proscene v2.0.0** is out. Being a stable release, it should now be possible to import it directly from your PDE. Otherwise download it [here](https://github.com/remixlab/proscene/releases/download/v-2.0.0/proscene-2.0.0.zip) 
and extract it to your sketchbook `libraries` folder.

Version 2 introduces a re-designed library architecture (details may be found [here](http://nakednous.github.io/projects/proscene/)) supporting all the features found in version 1 plus some others. Perhaps the two key new features are:

1. Support for 2D as well as 3D Processing renderers. Many of the examples are available in both cases.
2. Support to all sort of interaction mechanisms you can dream of. Check out the `examples.Demos.Android2DOF`, `examples.Demos.Android3DOF` and `examples.Demos.Kinect5DOF` (the gestures use to control the camera are found [here](https://www.youtube.com/watch?v=G8SEzFMmMyI)). The Section `examples.Input` offers some other interesting examples regarding this.

It's worth noticing that **ProScene** Android mode development is currently taken place at its own [fork](https://github.com/remixlab/proscene.droid) which we hope to integrate it back upstream once _TouchEvents_ are directly supported in **Processing**.
The Android examples mentioned above, however, only require the Android-mode of **Processing** to run.

This release also includes additional examples illustrating most of the new features. We are confident that a _learn-by-example_ methodology is the main (and most entertained) way to get use to them.
The [API](http://otrolado.info/prosceneApi/) has also been thoroughly reviewed and fully documented.

Happy hacking!

# Acknowledgments

Thanks to [Eduardo Moriana](http://edumo.net/) and [Miguel Parra](http://maparrar.github.io/) for their contributions with the [TUIO](http://www.tuio.org/)-based touch and kinect interfaces, respectively.
Thanks to experimental computational designer [Amnon Owed](https://twitter.com/AmnonOwed/media) for his collaboration with polishing the KeyFrameInterpolator sub-system.
Thanks to [Jacques Maire](http://www.xelyx.fr) for providing most of the examples found at the *contrib* section. Thansk to [Andres Colubri](http://codeanticode.wordpress.com/) for his continuous support and thorough insights.
Thanks to [Victor Forero](https://sites.google.com/site/proscenedroi/home) who is developing the [proscene Android port](https://github.com/remixlab/proscene.droid).
Thanks also to all **ProScene** users whose sketchs and library hacks always amaze us and inspire us.
