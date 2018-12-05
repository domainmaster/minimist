
![GitHub release](https://img.shields.io/github/release/mshjri/minimist.svg?style=for-the-badge)
# Minimist
Minimal personal theme for Hugo. 

---
![Homepage screenshot](/images/minimist.png)

---

## Features
- Responsive Design
- RSS
- Google Analytics
- Favicon
- PrismJS - Code Highlighting
- SEO-friendly
- BEM CSS

## Demo
Try Minimist on:
[minimist.netlify.com](https://minimist.netlify.com)

## How to Install, Override & Update
**Install**: To install Minimist on your Hugo website run the following command one-by-one in your website working directory.
```bash
git init
git submodule add https://github.com/mshjri/minimist.git themes/minimist

# copy the default config file (don't forget the dot):
cp themes/minimist/exampleSite/config.toml .
```
And start adding your content.

**Override**: To override CSS or JS rules, you can add your own rules to `custom.css` and `custom.js` inside the `/static` directory.

**Update**: To take advantage of the latest released features, update Minimist by running the following commands one-by-one in your website working directory.
```bash
cd themes/minimist
git checkout master
git pull
```
Make sure to remove your browser's cache before testing.

## How to create a main page (example.com/mypage)
To create an 'About' page or any main page (accessible from navigation), create a .md file in your 'content' directory by running the following
```bash
hugo new about.md
```
## How to create a section (list) page (example.com/blog)
To create a new section (list page) with descendant content pages, create .md files inside a folder with your section name, Or run the following command
```bash
hugo new tweets/mytweet.md
```
This will generate a `example.com/tweets` section  and `example.com/tweets/mytweet` page.

## How to add figures
Check [theme demo](blog/creating-a-new-theme/)

## Configuration
This is an example of the `config.toml` used in Minimist:
```toml
baseURL = "//example.com"
languageCode = "en-us"
title = "John Doe"
theme = "minimist"
copyright = "Copyright © 2018, John Doe; all rights reserved."

googleAnalytics = ""
pluralizeListTitles = false

[params]
    # meta
    author = "John Doe"
    keywords = "front-end,web,javascript,JS,HTML,CSS,development,developer"
    description = "Full stack web deveoper and blogger."
    
    # profile
    email = "john.doe@example.com"

    # Homepage brief
    enableHomepageBlogBrief = true
    briefSection = "blog" # specify a section to show links from ( "" (blank), will list recent pages from all sections)
    numberOfBriefLinks = 4
    more = "More"
    
    # footer
    showMinimistCredits = true

[[params.navigation]]
# navigation links
# [ [name, URL ], [hideOnMobile, hideOnItsOwnPage] ]
# hideOnMobile: will hide the link on screens smaller than 600px wide (default: false)
# hideItsOwnPage: will hide the navigation link for a page on the page itself (ex: hide 'about' link on the about page) (default: true)
    nav = [
        [ [ "Home", "/"], [false, true] ],
        [ [ "Portfolio", "https://portfolio.example.com"], [false, true] ],
        [ [ "Blog", "/blog/"], [false, false] ],
        [ [ "About", "/about/"], [false, true] ],
        [ [ "RSS", ""], [true, true] ], # rss url will be provided by default, remove line to disable RSS.
        # add more links here if needed
    ]    

[social]
    Github = "https://github.com/github"
    Medium = "https://medium.com/@medium"
    Twitter = "https://twitter.com/twitter"
```

## Contribution
If you find a bug, or have a feature request, feel free to open an issue or fork and contribute.

## Development

### Development environment setup

`npm start`: To launch a Hugo server using the theme along with the exampleSite content. Thus, Any edits can be performed on the theme root directory.

`npm test`: Runs 'hugo' to build the /public directory and serves it on localhost using Browsersync. Beneficial for testing changes on mobile devices.


### Planned features
Check [project board](https://github.com/mshjri/minimist/projects/1).

###   Navigation bar
The navigation bar uses a simple array that is manually edited in `config.toml`. I originally made it this way to keep it flexible in case of adding external links (subdomains, ..etc). However, this makes more overhead, so it would change in the next releases with better implementation.

### CSS
**BEM**: CSS following a mix of BEM and [ABEM](https://css-tricks.com/abem-useful-adaptation-bem/), except (2-3 specificity levels) on article body elements to give the user more flexibility (eg. writing HTML in markdown files)

**Responsive**: Minimist follows mobile-first design methodology. Thus, everything was designed to look better on mobile screens first, then media queries specify the changes for larger screens.

Media Queries:
- min-height 400px & landscape orientation: mobile on landscape with small height 
- min-width 600px: iPhone landscape and iPad portrait
- min-width 960px: iPad landscape, laptop, desktop screens
- min-width 1600px: Larger desktop screens


## Attribute
Minimist was influenced by [Hugo-Coder](https://github.com/luizdepra/hugo-coder/) theme.

## License
Minimist is licensed under the MIT License. Check the [LICENSE](https://github.com/mshjri/minimist/blob/master/LICENSE) file for details.

Minimist uses:
- [Normalize](https://github.com/necolas/normalize.css/) by  Nicolas Gallagher: MIT Licensed.
- [PrismJS](https://prismjs.com): MIT Licensed.

