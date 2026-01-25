---
title: "Kiran Bhattaram on Failure Detectors"
date: 2017-04-13
author: Big Pun
category: video
tags: meetup, video
label: Video
description: "Kiran Bhattaram on Failure Detectors"
ogp:
  og:
    description: "Kiran Bhattaram on Failure Detectors"
  fb:
    description: "Kiran Bhattaram on Failure Detectors"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/lwgH2GEos8k" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - March 27, 2017

**Kiran Bhattaram on Failure Detectors**

* **Meetup:** [https://www.meetup.com/papers-we-love/events/238056356/](https://www.meetup.com/papers-we-love/events/238056356/)
* **Papers and Links:**
  * [Impossibility of Distributed Consensuswith One Faulty Process](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf)
  * [Unreliable Failure Detectors for Reliable Distributed Systems](http://courses.csail.mit.edu/6.852/08/papers/CT96-JACM.pdf)
  * [A Brief Tour of FLP Impossibility](http://the-paper-trail.org/blog/a-brief-tour-of-flp-impossibility/)
* **Slides:** [Kiran Bhattaram on Failure Detectors](http://bit.ly/2paqEe2)
* **Audio:** [Kiran Bhattaram on Failure Detectors](http://bit.ly/2pxsimE)

**Description**

The problem of consensus is central to many distributed systems algorithms. Failure detectors are central to the way we think about consensus algorithms. In a fully asynchronous system, the [FLP impossibility result](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf) shows that no consensus solution that can tolerate crash failures exists! This simple, stunning result imposed a hard constraint on what could be solved in an asynchronous model.

The [FLP](http://the-paper-trail.org/blog/a-brief-tour-of-flp-impossibility/) result kicked off a flurry of research into ways to circumvent the impossibility result. Failure detectors were the most compelling abstraction proposed. These augmented the asynchronous model just enough to allow consensus, while retaining most of the neat abstractions that make asynchronous systems simple to reason about.

In this talk, I'll discuss some of the history and background of [Chandra and Toueg's failure detector proposal](http://courses.csail.mit.edu/6.852/08/papers/CT96-JACM.pdf), and discuss some failure detector mechanisms that followed the paper.

**Bio**

[Kiran](https://kiranbot.com) ([@kiranb](https://twitter.com/kiranb)) is a software engineer at [Stripe](https://stripe.com). At work, she's thinks a lot about distributed systems fallacies (https://kiranbot.com/fallacies) and how we can observe what our software is doing. A normal day working with Kiran involves conversations about operating distributed systems and learning that she made that awesome space dress she's wearing.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?feed=https%3A%2F%2Fwww.mixcloud.com%2Fpaperswelove%2Fkiran-bhattaram-on-failure-detectors%2F&hide_cover=1&mini=1" frameborder="0"></iframe>

**Slides**

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="596" id="talk_frame_387437" mozallowfullscreen="true" src="//speakerdeck.com/player/83392c0ea98842369fd2dea6b2ea15b1" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="https://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
