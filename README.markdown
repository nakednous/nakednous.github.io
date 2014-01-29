# Jean Pierre Charalambos website

Welcome to the source of my personal website powered by [octopress] (http://octopress.org/) using the
[octostrap3](http://kaworu.github.io/octopress/) theme.

It's pure fun to play with and should be super-easy to hack. Read on to learn how...

## Hacking procedure

1. Install the source

```sh
git clone https://github.com/nakednous/nakednous.github.io.git
cd nakednous.github.io
```

2. Setup deployment (to github pages)

```sh
bundle exec rake setup_github_pages
#We use the two-branching arch suggested here: http://octopress.org/docs/deploying/github/
#Other option would be:
#git checkout source 
#but this one makes bundle exec rake deploy below to fail
git branch -v
```

3. (Optionally) Update to upstream

```sh
git remote add octopress https://github.com/imathis/octopress.git
git remote -v
git pull octopress master
```

4. Add the git submodule containing the theme

```sh
git submodule init
git submodule update
cd .themes/octostrap3
git status
#if it gives you HEAD detached at ... then run:
git checkout master
git status
```

5. (Optionally) Update the theme to upstream

```sh
git remote -v
git remote add octostrap3 https://github.com/kAworu/octostrap3.git
git remote -v
git pull octostrap3 master
```

6. Complete the installation

```sh
cd ../..
gem install bundler
#edit your .bashrc to make bundler install gems locally (see: https://wiki.archlinux.org/index.php/ruby#Bundler)
#now install the gems locally
bundle install
#edit ~$HOME/.gem/ruby/2.1.0/gems/pygments.rb-0.3.7/lib/pygments/ to make it use python2 instead of python.
```

7. Install the octostrap3 theme

```sh
#following line would install default theme instead.
#bundle exec rake install
bundle exec rake 'install[octostrap3]'
bundle exec rake generate
bundle exec rake preview
```

8. To post and render the website to localhost

```sh
bundle exec rake new_post["Proscene v2.0.0-alpha3 Released"]
bundle exec rake generate
bundle exec rake preview
```

9. If bundle exec rake deploy fails pushing the generated source to the master branch then

```sh
bundle exec rake deploy
git push -f --set-upstream origin master
```

## License
(The MIT License)

Copyright © 2009-2013 Brandon Mathis

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
