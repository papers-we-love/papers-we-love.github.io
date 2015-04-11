---
title: Neha Narula on The Scalable Commutativity Rule
date: 2015-4-06
tags: meetup, video, newyork
label: Video
category: video
author: Darren
description: "Neha Narula on The Scalable Commutativity Rule in NYC"
ogp:
  og:
    description: "Neha Narula on The Scalable Commutativity Rule"
  fb:
    description: "Neha Narula on The Scalable Commutativity Rule"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/JE-jSZ8zToM" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - April 1, 2015

**Neha Narula** on The Scalable Commutativity Rule

* **Meetup:** [http://www.meetup.com/papers-we-love/events/221194444/](http://www.meetup.com/papers-we-love/events/221194444/)
* **Paper:** [http://bit.ly/1IzyXA7](http://bit.ly/1IzyXA7)
* **Slides:** [http://bit.ly/1GBP4y3](http://bit.ly/1GBP4y3)
* **Audio:** [http://bit.ly/1D5Rdkw](http://bit.ly/1D5Rdkw)

**Description**

Moore's law is over, or at least, we won't be making programs go faster by running on faster processors, but instead by parallelizing our code to use more of them.  Reasoning about concurrent code is difficult; but it's also very hard to understand whether your design has latent scalability bottlenecks until you can actually run it on many cores.  And what if the problem is in your interface, instead of just the implementation?

This paper presents a simple, elegant rule:  whenever interface operations commute, they can be implemented in a way that scales.

The authors apply this idea to Linux, and create a new operating system by using the rule, sv6.  Their paper also comes with software, COMMUTER, which can help developers evaluate their interfaces to find opportunities for scaling.

This is a very powerful idea, and probably has applications in other areas like distributed systems. In this talk I'll present the paper, and speculate a bit about where else this research could be useful.

**Bio**

Neha Narula (@neha) is a PhD candidate at MIT building fast, scalable distributed systems. In a previous life she was a Senior Software Engineer at Google, where she designed the first version of Blobstore, a system for storing and serving petabytes of immutable data, and worked on Native Client, a system for running native code securely through the browser.

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;" /></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank our platinum sponsor <a href="http://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
