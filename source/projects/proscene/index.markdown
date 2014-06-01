---
layout: page
title: "ProScene"
comments: false
sharing: true
footer: true
---

* auto-gen TOC:
{:toc}

<p>
<script src="/javascripts/processing.min.js"></script> 
<canvas data-processing-sources="/projects/proscene/arch.pde"></canvas>
<div class="example-links">
    Figure 1. Software Architecture
</div>
</p>

# Introduction

A 2D or 3D interactive [Processing](http://processing.org) [Scene](http://otrolado.info/prosceneApi/remixlab/dandelion/core/AbstractScene.html).
**ProScene** (pronounced similar as the Czech word **"prosím"** which means **"please"**) provides an interface
between [Dandelion](http://nakednous.github.io/projects/dandelion) and [Processing](http://processing.org) (Figure 1 depicts the software architecture).

**ProScene** provides seemless integration with **Processing**: its API has been designed to fit that of **Processing** and its implementation has been optimized to work along side with it. It supports all major **Processing** flavours: Desktop, JS, and Android.

**ProScene** support is led by the active and great Processing community at its [forum](http://forum.processing.org/two/search?Search=proscene) where you can reach us.

# Key features

* *Tested* under Linux, Mac OSX and Windows, and properly works with the JAVA2D, P2D and P3D Processing renderers. No special dependencies or requirements needed (apart of course from [Processing-2.x](http://processing.org/ Processing-1.5.1)).
* It supports all major **Processing** flavours: Desktop, JS, and Android.
* API design that provides seemless integration with **Processing** (e.g., providing flexible animation and drawing mechanisms), and allows extensibility of its key features.
* Default interactivity to your *Processing* scenes through the mouse and keyboard that simply does what you expect.
* Generic support for [Human Interface Devices](http://en.wikipedia.org/wiki/Human_interface_device).
* Arcball, walkthrough and third person camera modes.
* Hierarchical coordinate systems (frames), with functions to convert between them.
* Coordinate systems can easily be moved with the mouse.
* Keyframes.
* Object picking.
* Keyboard shortcuts and HID bindings customization.
* Animation framework.
* Screen drawing (i.e., drawing of 2d primitives on top of a 3d scene).
* Off-screen rendering mode support.
* Handy set of complete documented examples that illustrates the use of the package
* A complete [reference documentation](http://otrolado.info/prosceneApi/).
* Active support and continuous discussions led by the [Processing community](http://forum.processing.org/search/proscene).

# Origin of the name

**ProScene** not only means a *"pro-scene"*, but it is a two-phoneme word pronounced similar as the Czech word *"prosím"* (which means *"please"*), obtained by removing the middle phoneme (*"ce"*) of the word *pro-ce-ssing*. Thus, the name *"ProScene"* suggests the main goal of the package, which is to help you _shorten_ the creation of interactive 3D scenes in *Processing*.

# Usage

All library features requires a `Scene` object (which is the main package class) to be instantiated (usually within your sketch setup method). There are three ways to do that:

1. **Direct instantiation**. In this case you should instantiate your own Scene object at the `PApplet.setup()` function.
2. **Inheritance**. In this case, once you declare a `Scene` derived class, you should implement `proscenium()` which defines the objects in your scene. Just make sure to define the `PApplet.draw()` method, even if it's empty.
3. **External draw handler registration**. You can even declare an external drawing method and then register it at the Scene with `addDrawHandler(Object, String)`. That method should return `void` and have one single `Scene` parameter. This strategy may be useful when you have the same drawing code shared among multiple viewers.

See the examples **BasicUse**, **AlternativeUse**, and **AuxiliarViewer** for an illustration of these techniques. To get start using the library and learn its main features, have a look at the complete set of well documented examples that come along with it. Other uses are also covered in the example set and include (but are not limited to): drawing mechanisms, animation framework, and camera and keyboard customization. Advanced users may take full advantage of the fully documented [API reference](http://www.disi.unal.edu.co/grupos/remixlab/local/projects/proscene-1.1.0/reference/index.html) (which is also included in the package file).

# Hacking

## Read-only access setup

Use it as any other basic github repo, i.e.,:

{% codeblock lang:sh %}
# clone it:
git clone https://github.com/remixlab/proscene.git
cd proscene
# pull changes in:
# for pull requests simply refer to: https://help.github.com/articles/using-pull-requests
{% endcodeblock %}

## Read-write access setup

Clone the repo and add the remotes (here we refer to them as ["subtrees"](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/),
see Figure 1):

{% codeblock lang:sh %}
git clone https://github.com/remixlab/proscene.git
cd proscene
git remote add -f bias https://github.com/remixlab/bias_tree.git
git remote add -f fpstiming https://github.com/remixlab/fpstiming_tree.git
git remote add -f dandelion https://github.com/remixlab/dandelion_tree.git
git remote add -f util https://github.com/remixlab/util_tree.git
{% endcodeblock %}

Update from time to time:

{% codeblock lang:sh %}
#Fetching command, here <remote> is one of: bias, fpstiming, dandelion or util.
git fetch <remote> master
git subtree pull --prefix src/remixlab/<remote> <remote> master --squash
{% endcodeblock %}

To contribute back to upstream:

{% codeblock lang:sh %}
git push
{% endcodeblock %}

To contribute to a particular subtree (i.e., bias, fpstiming, dandelion, or util)

{% codeblock lang:sh %}
#Here <remote> is one of: bias, fpstiming, dandelion or util.
git subtree push --prefix=src/remixlab/<remote> <remote> master
{% endcodeblock %}

# Acknowledgments

Thanks to [Eduardo Moriana](http://edumo.net/) and [Miguel Parra](http://maparrar.github.io/) for their contributions with the [TUIO](http://www.tuio.org/)-based touch and kinect interfaces, respectively.
Thanks to experimental computational designer [Amnon Owed](https://twitter.com/AmnonOwed/media) for his collaboration with polishing the KeyFrameInterpolator sub-system.
Thanks to [Jacques Maire](http://www.xelyx.fr) for providing most of the examples found at the *contrib* section. Thansk to [Andres Colubri](http://codeanticode.wordpress.com/) for his continuous support and thorough insights.
Thanks to [Victor Forero](https://sites.google.com/site/proscenedroi/home) who is developing the [proscene Android port](https://github.com/remixlab/proscene.droid).
Thanks also to all **ProScene** users whose sketchs and library hacks always amaze us and inspire us.