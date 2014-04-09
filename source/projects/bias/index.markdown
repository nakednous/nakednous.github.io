---
layout: page
title: "BIAS"
comments: false
sharing: true
footer: true
---

* auto-gen TOC:
{:toc}

<p>
<script src="/javascripts/processing.min.js"></script> 
<canvas data-processing-sources="/projects/bias/arch.pde"></canvas>
<div class="example-links">
    Figure 1. Software Architecture
</div>
</p>

# Introduction

**BIAS**, (**B**)ogus-(**I**)nput (**A**)ction-(**S**)elector package. A package defining an interface between application event input
data (including but not limited to hardware input) and user-defined actions. The idea being that
various sorts of input data, mainly that gathered from an user-interaction (e.g., a mouse button being pressed and
dragged), may be modeled and reduced into high-level events. Those "bogus" events are then taken as input to
implement user-defined actions on application objects (e.g., push that button or select that geometry on the screen
and move it close to me).

# Targeted applications

Depending on whether or not the user define her own set of actions, targeted applications are:

## Action-less applications

Action-less applications simple require to reduce input data into a raw [BogusEvent](http://otrolado.info/prosceneApi/remixlab/bias/core/BogusEvent.html).

## Action-driven applications

In this case, the targeted applications for the package are those able to:

1. Itemize the application functionality into a list of actions (see [Action](http://otrolado.info/prosceneApi/remixlab/bias/core/Action.html)).
2. Reduce input data into a [BogusEvent](http://otrolado.info/prosceneApi/remixlab/bias/core/BogusEvent.html) and characterize it with a
[Shortcut](http://otrolado.info/prosceneApi/remixlab/bias/event/shortcut/Shortcut.html) (which are used to bind the user-defined
[Actions](http://otrolado.info/prosceneApi/remixlab/bias/core/Action.html)).
3. Implement each action item taking as input those (reduced) BogusEvents (see [Grabber](http://otrolado.info/prosceneApi/remixlab/bias/core/Grabber.html)
and [BogusEvent](http://otrolado.info/prosceneApi/remixlab/bias/core/BogusEvent.html)).

Observation: Third parties may not always need to implement their own [BogusEvents](http://otrolado.info/prosceneApi/remixlab/bias/core/BogusEvent.html)
but simply use (depart from) those already conveniently provided here:

1. [KeyboardEvent](http://otrolado.info/prosceneApi/remixlab/bias/event/KeyboardEvent.html), representing any keyboard.
2. [ClickEvent](http://otrolado.info/prosceneApi/remixlab/bias/event/ClickEvent.html) which stands for a button clicked.
3. [MotionEvent](http://otrolado.info/prosceneApi/remixlab/bias/event/MotionEvent.html) which represents data gathered from user motion, e.g., the user moves her
hand in front of a kinect, or a finger is being dragged on a touch screen surface. MotionEvents were modeled
according to their ["degrees-of-freedom (DOFs)"](http://en.wikipedia.org/wiki/Degrees_of_freedom_(mechanics)) (see
[DOF1Event](http://otrolado.info/prosceneApi/remixlab/bias/event/DOF1Event.html), [DOF2Event](http://otrolado.info/prosceneApi/remixlab/bias/event/DOF2Event.html),
[DOF3Event](http://otrolado.info/prosceneApi/remixlab/bias/event/DOF3Event.html) and [DOF6Event](http://otrolado.info/prosceneApi/remixlab/bias/event/DOF6Event.html)),
not only because they (DOF's) represent a nice property to classify input devices, but mainly because manipulating stuff on 3D may be performed differently
given events carrying different DOF's. Intuitively, the greater the DOF's the richer the user experience may be.

These default bogus-event set should serve as a common ground to all sorts of tangible interfaces manipulating
geometry on a 2D/3D space.

# Usage

Usage is simple:

1. Instantiate an [InputHandler](http://otrolado.info/prosceneApi/remixlab/bias/core/InputHandler.html).
2. Define your bogus events.
3. Define/implement some [Agents](http://otrolado.info/prosceneApi/remixlab/bias/core/Agent.html) capable of dealing with your events and register them 
at the handler (see [registerAgent(Agent)](http://otrolado.info/prosceneApi/remixlab/bias/core/InputHandler.html#registerAgent(remixlab.bias.core.Agent))).
4. Action-driven applications should additionally implement user-defined actions (see 
[performInteraction(BogusEvent)](http://otrolado.info/prosceneApi/remixlab/bias/core/Grabber.html#performInteraction(remixlab.bias.core.BogusEvent))).
In this case, to customize the user experience simply bind bogus event [Shortcuts](http://otrolado.info/prosceneApi/remixlab/bias/event/shortcut/Shortcut.html) 
(see [shortcut()](http://otrolado.info/prosceneApi/remixlab/bias/core/BogusEvent.html#shortcut())) to user-defined actions using the Agent
[Profiles](http://otrolado.info/prosceneApi/remixlab/bias/agent/profile/Profile.html).
5. Attach a call to [handle()](http://otrolado.info/prosceneApi/remixlab/bias/core/InputHandler.html#handle()) at the end of your main event (drawing) loop.

# Hacking

The package is developed as a [git subtree](https://github.com/git/git/blob/master/contrib/subtree/git-subtree.txt)
(see also ["here"](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/)). It should thus be made part of a
bigger (container) project (see Figure 1). The package only dependency is [util](https://github.com/remixlab/util_tree), package based
on [Daniel Bell gwt-hashcode-equals](https://code.google.com/p/gwt-hashcode-equals/) which provides ```hashCode()```,  ```equals()```  and  ```clone()```
Java implementations compatible with [gwt](http://www.gwtproject.org/). Note that **UTIL** is distributed as another git subtree.

## Initial setup

First (and only) time setup. Here ```<my_repo>``` is the project repo where you plan to include the **BIAS** and **UTIL** trees.

{% codeblock lang:sh %}
git clone <my_repo>
cd <my_repo>
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
git remote add -f bias https://github.com/remixlab/bias_tree.git
git remote add -f util https://github.com/remixlab/util_tree.git
{% endcodeblock %}

To update your **BIAS** subtree:

{% codeblock lang:sh %}
#fetching command:
git fetch bias master
git subtree pull --prefix src/remixlab/bias bias master --squash
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
