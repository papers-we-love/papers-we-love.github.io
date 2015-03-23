---
title: Sam Tobin-Hochstadt on Composable and Compilable Macros
date: 2015-02-05
tags: meetup, video, newyork
label: Video
category: video
author: Darren
description: "Video: Sam Tobin-Hochstadt on Composable and Compilable Macros (Racket)"
ogp:
  og:
    description: "Video: Sam Tobin-Hochstadt on Composable and Compilable Macros"
  fb:
    description: "Video: Sam Tobin-Hochstadt on Composable and Compilable Macros"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/pK2E63mhRxI" frameborder="0" allowfullscreen></iframe>

READMORE

[**Composable and Compilable Macros**](https://www.cs.utah.edu/plt/publications/macromod.pdf) introduces the Racket module system, which addresses the following problem: When you have macros that run programs at compile-time, how does this interact with separate compilation and ahead-of-time compilation. The paper introduces "phases", which enable Racket to behave the same regardless of when and how you compile your program. It also introduces the idea of writing different modules in different languages, which is now used for systems like Typed Racket.

**Links**

[Slides](http://bit.ly/1KNwpjC) [Audio](https://www.mixcloud.com/paperswelove/sam-tobin-hochstadt-on-composable-and-compilable-macros/) [Meetup](https://www.youtube.com/redirect?q=http%3A%2F%2Fwww.meetup.com%2Fpapers-we-love%2Fevents%2F220021234%2F&redir_token=vcCgfsZQJCCQgFtPF6xQWDsM67x8MTQyNzA2NDQ4NUAxNDI2OTc4MDg1)

**Bio**

Sam Tobin-Hochstadt ([@samth](http://twitter.com/samth)) is an Assistant Professor in the School of Informatics and Computing at Indiana University. He has worked on dynamic languages, type systems, module systems, and metaprogramming, including creating the Typed Racket system and popularizing the phrase “scripts to programs.” He is a member of the ECMA TC39 working group responsible for standardizing JavaScript, where he co-designed the module system for ES6, the next version of JavaScript. He received his PhD in 2010 from Northeastern University under Matthias Felleisen.

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;" /></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank our platinum sponsor <a href="http://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---

**Additional resources**

- _Syntactic Abstraction in Scheme_, Dybvig Hieb & Bruggeman, Lisp and Symbolic Computation 1993
- _Macros that Work Together_, Flatt, Findler, Culpepper, & Darais, JFP 2012
- _Submodules in Racket_, Flatt GPCE 2013
- _Implicit phasing for R6RS libraries_, Ghuloum & Dybvig, ICFP 2007
- _Extending the scope of syntactic abstraction_, Waddell & Dybvig, POPL 1999
