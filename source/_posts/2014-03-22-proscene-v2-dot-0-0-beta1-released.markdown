---
layout: post
title: "Proscene v2.0.0-beta1 Released"
date: 2014-03-22 18:04:51 -0500
comments: true
categories: proscene, dandelion, bias, fpstiming
---

Proscene v2.0.0-beta1 is out. Download it [here](https://github.com/remixlab/proscene/releases/download/v-2.0.0-beta.1/proscene-2.0.0-beta.1.zip) 
and extract it to your sketchbook `libraries` folder (automatic importing *Proscene* from your PDE is only available for stable releases, currently v-1.2.0).

The new API has been thoroughly reviewed and documented and may be considered frozen (unless something unexpected requiring a fix happens).
Check it out [here](http://otrolado.info/prosceneApi/). We are greatful to [Jacques Maire](http://www.alcys.com/) for contributing the new Proscene logo
code which is a [torus solenoid](http://www.mathcurve.com/courbes3d/solenoidtoric/solenoidtoric.shtml).

The new library architecture comprises the following packages:

## [FPSTiming](https://github.com/remixlab/fpstiming_tree)

A single-threaded [timing handler](http://otrolado.info/prosceneApi/remixlab/fpstiming/TimingHandler.html) providing timers and animators.
The package may be run stand-alone and it's provided in its [own tree](https://github.com/remixlab/fpstiming_tree).

## [BIAS](https://github.com/remixlab/bias_tree)

An [input handler](http://otrolado.info/prosceneApi/remixlab/bias/core/InputHandler.html) providing means to translate event input data into high-level
user-defined actions. The package represents the new Proscene event back-end, but it may be run stand-alone and it's provided in its
[own tree](https://github.com/remixlab/bias_tree) too.

## [Dandelion](https://github.com/remixlab/dandelion_tree)

Package implementing all sorts of (motion) [actions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.DandelionAction.html) on Frames
(coordinate systems). Dandelion depends on both, FPSTiming and BIAS. <!--- next version should mention it is language agnostic and the JS approach... -->

## Proscene

Package holding a single class (the [Scene](http://otrolado.info/prosceneApi/remixlab/proscene/Scene.html)) which represents an interface between Dandelion
and Processing.

Although the (high-level) [Scene API](http://otrolado.info/prosceneApi/remixlab/proscene/Scene.html) has been re-factored, Proscene1.x users may stick to it
and feel at home. Most of the examples ported from Proscene1.x look even simpler now. They all have been re-organized reflecting the new structure to
attract those willing to digg into the inners of the new architecture.

Expect for one or two more betas before the final release. We plan to improve the docs, particularly that of the examples. Please report any bug or issue you
may find and help us make the upcoming proscene2 as polished as possible.
