---
title: "Ben Linsay on HyperLogLog"
date: 2018-06-13
author: Andrew Gross
category: video
tags: meetup, video
label: Video
description: "Ben Lindsay on HyperLogLog"
ogp:
  og:
    description: "Ben Lindsay on HyperLogLog"
  fb:
    description: "Ben Lindsay on HyperLogLog"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/y3fTaxA8PkU" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - May 14th, 2018

****

* **Meetup:** [https://www.meetup.com/papers-we-love/events/245860299/](https://bit.ly/2sPHrDU)
* **Paper:** [http://algo.inria.fr/flajolet/Publications/FlFuGaMe07.pdf](https://bit.ly/1QlcaxD)
* **Slides:** [https://speakerdeck.com/pwl/ben-linsay-on-hyperloglog](https://bit.ly/2JMeza6)
* **Audio:** [https://www.mixcloud.com/paperswelove/ben-lindsay-on-hyperloglog/](https://bit.ly/2t5EwqL)

**Description**

This extended abstract describes and analyses a near-optimal probabilistic algorithm, HyperLogLog, dedicated to estimating the number of distinct elements (the cardinality) of very large data ensembles. Using an auxiliary memory of m units (typically, "short bytes"), HyperLogLog performs a single pass over the data and produces an estimate of the cardinality such that the relative accuracy (the standard error) is typically about 1.04/√m. This improves on the best previously known cardinality estimator, LogLog, whose accuracy can be matched by consuming only 64% of the original memory. For instance, the new algorithm makes it possible to estimate cardinalities well beyond 10^9 with a typical accuracy of 2% while using a memory of only 1.5 kilobytes. The algorithm parallelizes optimally and adapts to the sliding window model.


**Bio**

Ben Linsay (http://blinsay.com/) (@blinsay (https://twitter.com/blinsay)) is somehow still a software engineer. He's worked on distributed data processing pipelines in adtech, built and maintained APIs for small startups, and has accidentally been a DBA twice. Ben has written a couple HyperLogLog implementations in his spare time and doesn't really want to show them to anyone.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&mini=1&feed=%2Fpaperswelove%2Fben-lindsay-on-hyperloglog%2F" frameborder="0" ></iframe>

**Slides**

<script async class="speakerdeck-embed" data-id="03844f8896fa43eab764b79f90dcab2b" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>


---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
  <a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="https://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
