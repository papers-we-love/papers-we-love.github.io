---
title: "David Nolen on Parsing With Derivatives"
date: 2016-09-13
author: The Organization
category: video
tags: meetup, video
label: Video
description: "David Nolen on Parsing With Derivatives"
ogp:
og:
description: "David Nolen on Parsing With Derivatives"
fb:
description: "David Nolen on Parsing With Derivatives"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/FKiEsJiTMtI" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - August 24, 2016

**David Nolen on Parsing With Derivatives**

* **Meetup:** [http://www.meetup.com/papers-we-love/events/233240967/](http://www.meetup.com/papers-we-love/events/233240967/)
* **Paper:** [Parsing with Derivatives: A Functional Pearl](http://bit.ly/2cRG1j0)
* **Slides:** [David Nolen on Parsing With Derivatives](http://bit.ly/2cqiMLx)
* **Audio:** [David Nolen on Parsing With Derivatives](http://bit.ly/2cfLnc1)
* **PWL References:**
  * [Parsing with Derivatives by Matt Might (video)](https://youtu.be/ZzsK8Am6dKU)
  * [Yacc is dead: An update (post by Matt Might)](http://matt.might.net/articles/parsing-with-derivatives/)
  * [On the Complexity and Performance of Parsing with Derivatives (follow-up)](http://arxiv.org/abs/1604.04695)


**Description**

We present a functional approach to parsing unrestricted context-free grammars based on [Brzozowski's derivative of regular expressions](https://en.wikipedia.org/wiki/Brzozowski_derivative). If we consider context-free grammars as recursive regular expressions, Brzozowski's equational theory extends without modification to context-free grammars (and it generalizes to parser combinators). The supporting actors in this story are three concepts familiar to functional programmers - laziness, memoization and fixed points; these allow Brzozowski's original equations to be transliterated into purely functional code in about 30 lines spread over three functions.

Yet, this almost impossibly brief implementation has a drawback: its performance is sour - in both theory and practice. The culprit? Each derivative can double the size of a grammar, and with it, the cost of the next derivative.

Fortunately, much of the new structure inflicted by the derivative is either dead on arrival, or it dies after the very next derivative. To eliminate it, we once again exploit laziness and memoization to transliterate an equational theory that prunes such debris into working code. Thanks to this compaction, parsing times become reasonable in practice.

We equip the functional programmer with two equational theories that, when combined, make for an abbreviated understanding and implementation of a system for parsing context-free languages.

**Bio**

[David Nolen](http://swannodette.github.io/) ([@swannodette](https://twitter.com/swannodette/)) is a Software Engineer for [Cognitect](http://cognitect.com/) and the lead developer of [ClojureScript](https://github.com/clojure/clojurescript). He likes making music, [playing Go](http://swannodette.github.io/baduk/baduk/2016/01/08/hello-baduk.html), and reading interesting papers.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?feed=https%3A%2F%2Fwww.mixcloud.com%2Fpaperswelove%2Fdavid-nolen-on-parsing-with-derivatives%2F&hide_cover=1&mini=1" frameborder="0"></iframe>

**Slides**

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="596" id="talk_frame_358865" mozallowfullscreen="true" src="//speakerdeck.com/player/e0403b0dcc6c41828151d5e449b7853c" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="http://www.twosigma.com">TwoSigma</a>, and, host, <a href="https://careers.twitter.com/en/locations/new-york.html">Twitter NYC</a>, for helping to make this meetup possible.</span>
</p>

---
