---
title: "Jason Ganetsky on Making a Fast Curry: Push/Enter vs. Eval/Apply for Higher-order Languages"
date: 2015-7-23
tags: meetup, video, newyork
label: Video
category: video
author: Darren
description: "Jason Ganetsky on Making a Fast Curry: Push/Enter vs. Eval/Apply for Higher-order Languages"
ogp:
  og:
    description: "Jason Ganetsky on Making a Fast Curry: Push/Enter vs. Eval/Apply for Higher-order Languages"
  fb:
    description: "Jason Ganetsky on Making a Fast Curry: Push/Enter vs. Eval/Apply for Higher-order Languages"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/PDkhwIXjQHw" frameborder="0" allowfullscreen></iframe>

READMORE

## San Francisco - May 21, 2015

**Jason Ganetsky** on Making a Fast Curry: Push/Enter vs. Eval/Apply for Higher-order Languages

* **Meetup:** [http://bit.ly/1DuZQCb](http://bit.ly/1DuZQCb)
* **Paper:** [http://bit.ly/1gOp7mb](http://bit.ly/1gOp7mb)
* **Slides:** [http://bit.ly/1KkZlzL](http://bit.ly/1KkZlzL)
* **Audio:** [http://bit.ly/1RQJW0O](http://bit.ly/1RQJW0O)

<iframe src="https://docs.google.com/presentation/d/11_VNU8ov0ZQIoZZtj390gXOr4VB0BLo1Y9UcoWGgSF8/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="569" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

**Description**

Higher-order languages that encourage currying are typically implemented using one of two basic evaluation models: push/enter or eval/apply. Implementors use their intuition and qualitative judgements to choose one model or the other. Our goal in this paper is to provide, for the first time, a more substantial basis for this choice, based on our qualitative and quantitative experience of implementing both models in a state-of-the-art compiler for Haskell.

Our conclusion is simple, and contradicts our initial intuition: compiled implementations should use eval/apply.

**Bio**

Jason Ganetsky ([@ganetsky](https://twitter.com/ganetsky)) is a software engineer at Google. He is tech lead of storage for [Google Cloud Pub/Sub](https://cloud.google.com/pubsub/docs). Prior to working at Google, Jason worked at various startups in NYC, and was briefly enrolled in a Computer Science PhD program at Carnegie Mellon. It was that brief stint that sparked the beginning of Jason's lifelong love of functional programming and type systems.

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="http://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
