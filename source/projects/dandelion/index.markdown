---
layout: page
title: "Dandelion"
comments: false
sharing: true
footer: true
---

* auto-gen TOC:
{:toc}

<p>
<script src="/javascripts/processing.min.js"></script> 
<canvas data-processing-sources="/projects/dandelion/arch.pde"></canvas>
<div class="example-links">
    Figure 1. Software Architecture
</div>
</p>

# Introduction

A package providing interactivity to [Frames](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Frame.html)
(coordinate systems) allowing picking and motion control of objects. Dandelion supports different interaction mechanisms, including the standard
mouse and keyboard, but it is not particularly tie to any of them, i.e., it's *device agnostic* by design. Frames may be attached
not only to user-space objects (thus controlling their motion), but to the [Eye](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Eye.html) to control
the [Scene](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html)
viewpoint. The powerful [Frame API](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Frame.html) allows transforming points and
vectors among different Frame instances, thus providing means to easily implement Scene-Graphs.

# Action-driven package

The whole package is based on a pre-defined (pre-implemented) [action set](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.DandelionAction.html)
whose elements can be related to different interaction
mechanisms, simply according to their [degrees-of-freedom (DOFs)](http://en.wikipedia.org/wiki/Degrees_of_freedom_(mechanics)).
DOFs provide a nice interface between (motion)
actions and input data, representing a convenient abstraction layer for it. Dandelion actions are thus grouped
together according to their DOFs in the following sub-sets:

1. [ClickActions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.ClickAction.html), that may be triggered when a button is clicked.
2. [KeyboardActions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.KeyboardAction.html), that may be triggered when a key is pressed.
3. [WheelActions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.WheelAction.html), that may be triggered when a wheel event occurred.
4. [DOF2Actions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.DOF2Action.html), that may be triggered when a DOF2 gesture is captured
(such as a mouse button drag).
5. [DOF3Actions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.DOF3Action.html), that may be triggered when a DOF3 gesture is captured
(such those performed with some joystics).
6. [DOF6Actions](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.DOF6Action.html), that may be triggered when a DOF6 gesture is captured
(such those performed with a kinect).

Sub-group constitutions with their individual action descriptions are available [here](http://otrolado.info/prosceneApi/remixlab/dandelion/core/Constants.html).

This action-driven design allows to easily support all sorts of interaction mechanisms, such as when adding an [HID](http://en.wikipedia.org/wiki/Human_interface_device), without having the need to
re-implement any of the supported actions.

# Usage

Third party (concrete) Scenes should derive from the [AbstractScene](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html)
and then:

1. (Optionally) Define a custom [matrixHelper](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#matrixHelper()), 
only if the target platform (such as Processing) provides its own matrix handling.
2. Call [setEye(Eye)](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#setEye(remixlab.dandelion.core.Eye))
to set the [eye()](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#eye()), once it's known if the
Scene [is2D()](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#is2D())
or [is3D()](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#is3D()).
3. Instantiate some [agents](http://otrolado.info/prosceneApi/remixlab/bias/core/Agent.html) register them at the [inputHandler()](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#inputHandler()).
4. Define whether or not the Scene [isOffscreen()](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#isOffscreen()).
5. Call [init()](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html#init()) at the end of the constructor.

finally, implement all the abstract methods which mainly deals with how the visual hints are drawn.

For an example, please refer to [ProScene](http://nakednous.github.io/projects/proscene) which provides
a [Processing](http://processing.org/) implementation of Dandelion.

# Hacking

The package is developed as a [git subtree](https://github.com/git/git/blob/master/contrib/subtree/git-subtree.txt)
(see also ["here"](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/)). It should thus be made part of a
bigger (container) project (like [ProScene](http://nakednous.github.io/projects/proscene), see Figure 1 ).
The package dependencies are [BIAS](http://nakednous.github.io/projects/bias), [FPSTiming](http://nakednous.github.io/projects/fpstiming)
and [util](https://github.com/remixlab/util_tree) (which
provides ```hashCode()```,  ```equals()```  and  ```clone()``` Java implementations compatible with [gwt](http://www.gwtproject.org/)).
Note that **BIAS**, **FPSTIMING** and **UTIL** are distributed as another git subtrees.

## Initial setup

First (and only) time setup. Here ```<my_repo>``` is the project repo where you plan to include the **DANDELION**, **FPSTIMING**, **BIAS** and **UTIL** trees.

{% codeblock lang:sh %}
git clone <my_repo>
cd <my_repo>
git remote add -f dandelion https://github.com/remixlab/dandelion_tree.git
git subtree add --prefix src/remixlab/dandelion dandelion master --squash
git remote add -f fpstiming https://github.com/remixlab/fpstiming_tree.git
git subtree add --prefix src/remixlab/dandelion dandelion master --squash
git remote add -f bias https://github.com/remixlab/bias_tree.git
git subtree add --prefix src/remixlab/bias bias master --squash
git remote add -f util https://github.com/remixlab/util_tree.git
git subtree add --prefix src/remixlab/util util master --squash
{% endcodeblock %}

Now ```git push``` will push the trees into your remote repo. From now on you will be able to use your repo
as any other basic git repo:

{% codeblock lang:sh %}
#clone it:
git clone <my_repo>
cd <my_repo>
#If you want to submit changes to some the trees please
#refer to: https://help.github.com/articles/using-pull-requests
{% endcodeblock %}

## Read-write access setup (only for developers who have been granted read-write access to the trees)

(do the initial setup above first)

Clone the repo and add the remotes:

{% codeblock lang:sh %}
git clone <my_repo>
cd <my_repo>
git remote add -f dandelion https://github.com/remixlab/dandelion_tree.git
git remote add -f fpstiming https://github.com/remixlab/fpstiming_tree.git
git remote add -f bias https://github.com/remixlab/bias_tree.git
git remote add -f util https://github.com/remixlab/util_tree.git
{% endcodeblock %}

To update your **DANDELION** subtree:

{% codeblock lang:sh %}
#fetching command:
git fetch dandelion master
git subtree pull --prefix src/remixlab/dandelion dandelion master --squash
{% endcodeblock %}

To update your **BIAS** subtree:

{% codeblock lang:sh %}
#fetching command:
git fetch bias master
git subtree pull --prefix src/remixlab/bias bias master --squash
{% endcodeblock %}

To update your **FPSTIMING** subtree:

{% codeblock lang:sh %}
#fetching command:
git fetch fpstiming master
git subtree pull --prefix src/remixlab/fpstiming fpstiming master --squash
{% endcodeblock %}

To update your **UTIL** subtree:

{% codeblock lang:sh %}
#fetching command:
git fetch util master
git subtree pull --prefix src/remixlab/util util master --squash
{% endcodeblock %}

To contribute to the main project:

{% codeblock lang:sh %}
git push
{% endcodeblock %}

To contribute to the **BIAS** subtree:

{% codeblock lang:sh %}
git subtree push --prefix=src/remixlab/bias bias master
{% endcodeblock %}

To contribute to the **UTIL** subtree:

{% codeblock lang:sh %}
git subtree push --prefix=src/remixlab/util util master
{% endcodeblock %}
