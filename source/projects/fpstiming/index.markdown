---
layout: page
title: "FPSTiming"
comments: false
sharing: true
footer: true
---

* auto-gen TOC:
{:toc}

<p>
<script src="/javascripts/processing.min.js"></script> 
<canvas data-processing-sources="/projects/fpstiming/arch.pde"></canvas>
<div class="example-links">
    Figure 1. Software Architecture
</div>
</p>

# Introduction

A small footprint package implementing single threaded timers by taking the application frame rate as a clock. Each application using **FPSTiming**
should simply:

1. Instantiate a single [TimingHandler](http://otrolado.info/prosceneApi/remixlab/fpstiming/TimingHandler.html).
2. Schedule some tasks to be executed periodically, see [registerTask(TimingTask)](http://otrolado.info/prosceneApi/remixlab/fpstiming/TimingHandler.html#registerTask(remixlab.fpstiming.TimingTask)).
3. Register some animation objects [registerAnimator(Animator)](http://otrolado.info/prosceneApi/remixlab/fpstiming/TimingHandler.html#registerAnimator(remixlab.fpstiming.Animator)).
4. Call [handle()](http://otrolado.info/prosceneApi/remixlab/fpstiming/TimingHandler.html#handle()) from within the application main event loop.

# Hacking

The package is developed as a [git subtree](https://github.com/git/git/blob/master/contrib/subtree/git-subtree.txt)
(see also ["here"](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/)). It should thus be made part of a
bigger (container) project (see Figure 1).

## Initial setup

First (and only) time setup. Here ```<my_repo>``` is the project repo where you plan to include the **FPSTiming** tree.

{% codeblock lang:sh %}
git clone <my_repo>
cd <my_repo>
git remote add -f fpstiming https://github.com/remixlab/fpstiming_tree.git
git subtree add --prefix src/remixlab/fpstiming fpstiming master --squash
{% endcodeblock %}

Now ```git push``` will push the tree into your remote repo. From now on you will be able to use your repo
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
git remote add -f fpstiming https://github.com/remixlab/fpstiming_tree.git
{% endcodeblock %}

To update the **FPSTiming** subtree:

{% codeblock lang:sh %}
#fetching command:
git fetch fpstiming master
git subtree pull --prefix src/remixlab/fpstiming fpstiming master --squash
{% endcodeblock %}

To contribute to the main project:

{% codeblock lang:sh %}
git push
{% endcodeblock %}

To contribute to the **FPSTiming** subtree:

{% codeblock lang:sh %}
git subtree push --prefix=src/remixlab/fpstiming fpstiming master
{% endcodeblock %}