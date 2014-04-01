---
layout: page
title: "about"
date: 2014-03-31 17:59
comments: false
sharing: true
footer: true
---

I'm currently Associate Professor at [National University of Colombia](www.unal.edu.co). I'm interested in all sorts of interactions,
mainly computer-based. I enjoy literature, mainly science fiction. I like playing table tennis, chess and practicing yoga.

Welcome to the source of my personal website powered by [octopress] (http://octopress.org/) using the
[octostrap3](http://kaworu.github.io/octopress/) theme.

It's pure fun to play with and should be super-easy to hack. Read on to learn how...

# Hacking procedure

* Install the source

{% codeblock lang:sh %}
git clone https://github.com/nakednous/nakednous.github.io.git
cd nakednous.github.io
{% endcodeblock %}

* Setup deployment (to github pages)

{% codeblock lang:sh %}
#We use a two-branching architecture (http://octopress.org/docs/deploying/github/)
git checkout source
git branch -v
#Tip found here: http://weishi.github.io/blog/2013/07/24/setup-an-existing-octopress-repository-after-git-clone/
mkdir _deploy
cd _deploy
git init
git remote add -t master -f origin https://github.com/nakednous/nakednous.github.io.git
cd ..
{% endcodeblock %}

* (Optionally) Update to upstream

{% codeblock lang:sh %}
git remote add octopress https://github.com/imathis/octopress.git
git remote -v
git pull octopress master
{% endcodeblock %}

* Add the git submodule containing the theme

{% codeblock lang:sh %}
git submodule init
git submodule update
cd .themes/octostrap3
{% endcodeblock %}

* (Optionally) Update the theme to upstream

{% codeblock lang:sh %}
git remote -v
git remote add octostrap3 https://github.com/kAworu/octostrap3.git
git remote -v
git pull octostrap3 master
{% endcodeblock %}

* Complete the installation

{% codeblock lang:sh %}
cd ../..
gem install bundler
#edit your .bashrc to make bundler install gems locally (see: https://wiki.archlinux.org/index.php/ruby#Bundler)
#now install the gems locally
bundle install
#edit ~$HOME/.gem/ruby/2.1.0/gems/pygments.rb-0.3.7/lib/pygments/ to make it use python2 instead of python.
{% endcodeblock %}

* Install the octostrap3 theme

{% codeblock lang:sh %}
#following line would install default theme instead.
#rake install
rake 'install[octostrap3]'
rake generate
rake preview
{% endcodeblock %}

* To post and render the website to localhost

{% codeblock lang:sh %}
rake new_post["Proscene v2.0.0-alpha3 Released"]
rake generate
rake preview
{% endcodeblock %}

* Deploy (to github pages)

{% codeblock lang:sh %}
rake deploy
{% endcodeblock %}

<!---
* If `rake deploy` fails pushing the generated source to the master branch then

{% codeblock lang:sh %}
git push -f --set-upstream origin master
{% endcodeblock %}
-->

* Commit and push the modified sources

{% codeblock lang:sh %}
git add .
git commit -m 'your message'
git push origin source
{% endcodeblock %}

## License
(The MIT License)

Copyright © 2009-2013 Brandon Mathis

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
