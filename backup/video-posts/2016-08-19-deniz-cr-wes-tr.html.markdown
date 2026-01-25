---
title: "Deniz Altinbüken on Chain Replication (old and new) & Wes Chow (Mini) on Tiered Replication"
date: 2016-08-19
author: The Organization
category: video
tags: meetup, video
label: Video
description: "Deniz Altinbüken on Chain Replication (old and new) & Wes Chow (Mini) on Tiered Replication"
ogp:
og:
description: "Deniz Altinbüken on Chain Replication (old and new) & Wes Chow (Mini) on Tiered Replication"
fb:
description: "Deniz Altinbüken on Chain Replication (old and new) & Wes Chow (Mini) on Tiered Replication"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/1hDjkV4iFzs" frameborder="0" allowfullscreen></iframe>

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/JMmV4wwXvCs" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - July 27, 2016

**Deniz Altinbüken on Chain Replication (old and new) & a PWL-Mini with Wes Chow**

* **Meetup:** [http://www.meetup.com/papers-we-love/events/231862215/](http://www.meetup.com/papers-we-love/events/231862215/)
* **Papers:**
  * [Chain Replication for Supporting High Throughput and Availability](http://bit.ly/1K3UUJf)
  * [Tiered Replication: A Cost-effective Alternative to Full Cluster Geo-replication](http://bit.ly/2b2f2yV)
* **Slides:**
  * [Deniz Altinbüken on Chain Replication (old and new)](http://bit.ly/2bENnsi)
  * [Wes Chow (Mini) on Tiered Replication](http://bit.ly/2bBbKVj)
* **Audio:**
  * [Deniz Altinbüken on Chain Replication (old and new)](http://bit.ly/2bgctwO)
  * [Wes Chow (Mini) on Tiered Replication](http://bit.ly/2bltdQk)
* **PWL References:**
  * [Chris Meiklejohn on Chain Replication at PWLSF](http://paperswelove.org/2015/video/nathan-taylor-chris-meiklejohn-os-scalability-chain-replication/)
  * [Chris Meiklejohn's overview of Chain Replication papers](http://paperswelove.org/2015/topic/christopher-meiklejohns-a-brief-history-of-chain-replication/)
  * [Copysets: Reducing the Frequency of Data Loss in Cloud Storage](https://www.usenix.org/system/files/conference/atc13/atc13-cidon.pdf)


**Description**

### Chain Replication

*Chain Replication (CR)* is a variant of Primary-Backup Replication that supports high throughput and fast recovery from failures. CR has been widely used in both commercial systems and academic research prototypes. In so doing, various shortcomings of the original CR protocol have come to light. In this talk, I will summarize these findings and present a new version of CR that addresses the shortcomings. Our improved CR protocol supports different consistency guarantees, avoids the tail bottleneck for reads, and introduces autonomous reconfiguration of the system without requiring an external master. Additionally, we have developed a formal end-to-end specification of the protocol, including the actions of clients, detailing reconfiguration and linearizable execution of client requests. Through this specification, we are able to reason about the new protocol more precisely and implement the protocol effortlessly. Lastly, I will contrast our approach to the related work.

### Tiered Replication

*Tiered Replication*, by Cidon et. al, explores the problem of effective data replication strategies first introduced in the [Copysets paper](https://www.usenix.org/system/files/conference/atc13/atc13-cidon.pdf), awarded [2013 Usenix ATC Best Student Paper](https://www.usenix.org/conference/atc15/technical-session/presentation/cidon). While Copysets introduced a randomized algorithm for solving NP Hard redundancy and load balancing constraints around placement of data in distributed filesystem, Tiered Replication proposes a greedy algorithm for solving the same problem and also adding the ability to bake in real world constraints such as rack awareness. Wes will summarize the problem Copysets proposed, show [Tiered Replication’s solution](https://github.com/chartbeat-labs/trepl), and examine a real world deployment of the algorithm at Chartbeat.

**Bios**

[*Deniz Altinbüken*](http://www.cs.cornell.edu/~deniz/) ([@denizaltinbuken](https://twitter.com/denizaltinbuken)) is a Ph.D. candidate in Distributed Systems at Cornell University, working with Robbert van Renesse. Her interests are in distributed systems and the theory of distributed computing with a focus on building infrastructure services for large-scale distributed systems. She loves breaking distributed systems down to their basic components, understanding the bits and pieces of what makes them work and explaining these in precise ways with the objective of making complicated systems easier to understand and implement.

*Wes Chow* ([@weschow](https://twitter.com/weschow)) has a B.S. in Electrical Engineering & Computer Science from UC Berkeley. He spent eight years building technical infrastructure for high frequency trading shops. One day, he stared into his dark soul and realized he needed to move into the startup light. Thus S7 Labs sprang into being, and he led teams that built Storybox, a Seedcamp NY finalist, and Songza Radio, subsumed by Google Music. He's now at [Chartbeat](https://chartbeat.com/) serving out his term as CTO.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?feed=https%3A%2F%2Fwww.mixcloud.com%2Fpaperswelove%2Fdeniz-alt%25C4%25B1nb%25C3%25BCken-on-chain-replication-old-and-new%2F&hide_cover=1&mini=1" frameborder="0"></iframe>

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?feed=https%3A%2F%2Fwww.mixcloud.com%2Fpaperswelove%2Fwes-chow-mini-on-tiered-replication-a-cost-effective-alternative-to-full-cluster-geo-replication%2F&hide_cover=1&mini=1" frameborder="0"></iframe>

**Slides**

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="596" id="talk_frame_355154" mozallowfullscreen="true" src="//speakerdeck.com/player/5e859104d3ac48ba91fb29279274f64c" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="611" id="talk_frame_356073" mozallowfullscreen="true" src="//speakerdeck.com/player/43e7bc0338074cfab0f3a729fc13f4d7" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="http://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
