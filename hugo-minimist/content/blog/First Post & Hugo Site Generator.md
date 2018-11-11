---
title: "First Post & Hugo Site Generator"
date: 2017-07-29T18:40:55+04:00
draft: false
---

For a long time I've been planning to have my own blog and publish the articles that have been living on my desktop for a while, until three days ago when I was going back and forth between tutorials and examples teaching Webpack for myself (I'll post about it soon) and visited a blog which is built using Hugo. Of course I noticed because I use a [chrome extension](https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg?hl=en) for that. Without giving it a thought I headed to '[Quick Start](https://gohugo.io/getting-started/quick-start/)' page in Hugo docs and started building. 

Guess what? 10 minutes and I already have my own blog (it shouldn't take more than 3 minutes from you, but because of how perfectionist I am, I had to update everything).

Let's cut to the chase. I've tried [Jekyll](https://jekyllrb.com/), [Cactus](cactusformac.com), and played with [Middleman](https://middlemanapp.com/) before, and now Hugo, and I'm impressed. Although I know nearly zero things about Go language (which Hugo is built in) I was able to install the themes and customize it with almost no problem at all. I like how the config file is so clear and simple (toml rocks!), folder structure too. The commands used to build the website are straightforward and debugging errors is easy. Even if you have zero experience with the command-line you would be able to do it in a matter of minutes. I'm not kidding, it's easy to the extent that you can create a website blindfolded (I tried it!). Best thing? [Themes](https://themes.gohugo.io/) 😍. +100 themes are ready to be installed with one command.

I don't want to sound like a fanboy but the errors I had to debug when building with Jekyll really made me think that it has to be a tiresome process to customize a static site theme, especially if you don't know the templating language used. This time I had no problem.

### My setup
Currently I use [Hugo-Cactus-Theme](https://github.com/digitalcraftsman/hugo-cactus-theme). Which is one of the default Themes in Cactus. It's quite simple and clean. Still I had to tweak it a bit. I moved the social links to be inside the 'profile' div so it becomes on top of posts. Added few dots separator between the description and the links because it looks nice. duh! And added more width to the main container on desktop screens.

### Deployment
IMPORTANT: If you're going to use this same theme, edit the absolute paths to relative. It's going to solve your problem I know it! To do this use your editor's Replace functionality to search for 'absURL' in all the files inside 'themes/hugo-cactus-theme/layouts' and replace it to 'relURL', then set 'relativeURLs = true' in your 'config.toml'.

Next, just go and remove your '/public' directory and rebuild your blog, and the public folder will be created again all new and shiny. Copy the contents of '/public' to your web server and you're all set up.

### Plans
Because I'm the perfectionist and lazy person I am, I will probably write a bash or ruby script to automate the deployment process so posting can be easier. I should also think about integrating Webpack for no reason at all.

Hope this become a good start for it. Keep coming back!

-- Omar