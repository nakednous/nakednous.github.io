---
layout: post
title: "Proscene v2.0.3 Released"
date: 2014-07-25 10:41:47 -0500
comments: true
categories: proscene dandelion bias fpstiming
---

**Proscene v2.0.3** is out. It should be possible to import it directly from your PDE. Otherwise download it [here](https://github.com/remixlab/proscene/releases/download/v-2.0.3/proscene-2.0.3.zip) 
and extract it to your sketchbook `libraries` folder.

# Changelog

1. Many examples have been improved. For instance, those focusing interactivity to a particular Frame from the `scene.mouseAgent()`, such as `Frame.FrameInteraction` have been
simplified.
2. The following (missing) functions were added to the Scene: `isMouseButtonActionBound(Target target, DOF2Action action)`, `isMouseWheelActionBound(Target target, DOF1Action action)`
and `isMouseClickActionBound(Target target, ClickAction action)`. The `Eye.CadCamera` example illustrates them.
3. The `remixlab.bias.agent.profile` API has slightly been changed to be unified across all its classes taking the `remixlab.bias.agent.profile.Profile` base class as a model.
Methods holding the old syntax have been marked as deprecated, e.g., `KeyboardProfile.shortcut()`, `KeyboardProfile.isShortcutInUse()`, `KeyboardProfile.isKeyboardActionBound()`;
use `KeyboardProfile.binding()`, `KeyboardProfile.isBindingInUse()`, `KeyboardProfile.isActionBound()` respectively, instead.