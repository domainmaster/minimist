---
title: "Theme Demo"
date: 2018-11-28T18:21:28+04:00
draft: true
---

**Please refer to the markdown (.md) file for this guide to learn how to return specific HTML elements in markdown.**

# h1: Hello, world!
## h2: Hello, world!
### h3: Hello, world!
#### h4: Hello, world!
##### h5: Hello, world!
###### h6: Hello, world!


This is a paragraph lorem ipsum **Bold text.** dolor sit amet consectetur _Italic text._ adipisicing [link](example.com) elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit

**This is bold text**

_This is italic text_

~~Deleted text~~

[this is a link](example.com)

{{< figure src="../img.png" caption="This is figure caption" alt="Alternative text">}}

> This is a quote block, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim

---

## Lists

- Unordered
- Lists
- Bullets


1. Ordered
2. Lists
3. Numers


- This is a nested list
    - Hello
        - wow
    - world!

- An ordered nested list
    1. first option
        1. first of the first
    2. second option


## Semantic elements
This is an abbreviation element  <abbr title="Content Delivery Network">CDN</abbr>. While this is a keyboard shortcut <kbd>Ctrl + Alt</kbd>. However, here is a super text <sup>[1]</sup> element.

## Code
This is an inline `code`

```css
    .article__code{
        font-family:Menlo, Monaco, Courier; 
        background-color:#EEE; font-size:14px; 
        padding: 4px; 
        font-weight: 600;
    }
```

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

## Simple markdown tabels
| title        | title        | title        |
|--------------|--------------|--------------|
| cell 1       | cell 2       | cell 3       |
| cell 1       | cell 2       | cell 3       |
| cell 1       | cell 2       | cell 3       |


## HTML table (supports table footer and caption)
<table>
    <caption>Table 1.1: shows income spending for minimist</caption>
    <thead>
        <tr>
            <th>title</th>
            <th>title</th>
            <th>title</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>cell 1</td>
            <td>cell 1</td>
            <td>cell 1</td>
        </tr>
        <tr>
            <td>cell 1</td>
            <td>cell 1</td>
            <td>cell 1</td>
        </tr>
        <tr>
            <td>cell 1</td>
            <td>cell 1</td>
            <td>cell 1</td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <th>footer cell</th>
            <th>footer cell</th>
            <th>footer cell</th>
        </tr>
    </tfoot>
    
</table>