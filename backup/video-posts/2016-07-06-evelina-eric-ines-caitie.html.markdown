---
title: "Papers We Love - QCon NYC Edition w/ Evelina, Eric, Ines, & Caitie "
date: 2016-07-06
author: Philosophy Science!!!
category: video
tags: meetup, video
label: Video
description: "Papers We Love - QCon NYC Edition w/ Evelina, Eric, Ines, & Caitie on 2016-07-06"
ogp:
og:
description: "Papers We Love - QCon NYC Edition w/ Evelina, Eric, Ines, & Caitie on 2016-07-06"
fb:
description: "Papers We Love - QCon NYC Edition w/ Evelina, Eric, Ines, & Caitie on 2016-07-06"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/-3tw2MYYT0Q" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - June 14, 2016

Papers We Love - QCon NYC Edition w/ **Evelina, Eric, Ines, & Caitie**

* **Meetup:** [http://www.meetup.com/papers-we-love/events/231394908/](http://www.meetup.com/papers-we-love/events/231394908/)
* **Papers:**
  * [Mastering the Game of Go with Deep Neural Networks and Tree Search](http://bit.ly/1P2dD7H)
  * [Experience with Processes and Monitors in Mesa](http://bit.ly/29tCFFp)
  * [IronFleet: Proving Practical Distributed Systems Correct](http://bit.ly/29tC9XP)
  * [Simple Testing Can Prevent Most Critical Failures...](http://bit.ly/1oNFHjs)
* **Audio:** [https://www.mixcloud.com/paperswelove/papers-we-love-qcon-nyc-edition-w-evelina-eric-ines-caitie/](https://www.mixcloud.com/paperswelove/papers-we-love-qcon-nyc-edition-w-evelina-eric-ines-caitie/)

**Abstracts**

*Evelina Gabasova presenting on Mastering the Game of Go with Deep Neural Networks and Tree Search*:

The game of Go has long been viewed as the most challenging of classic games for artificial intelligence due to its enormous search space and the difficulty of evaluating board positions and moves. We introduce a new approach to computer Go that uses value networks to evaluate board positions and policy networks to select moves. These deep neural networks are trained by a novel combination of supervised learning from human expert games, and reinforcement learning from games of self-play. Without any lookahead search, the neural networks play Go at the level of state-of-the-art Monte-Carlo tree search programs that simulate thousands of random games of self-play. We also introduce a new search algorithm that combines Monte-Carlo simulation with value and policy networks. Using this search algorithm, our program AlphaGo achieved a 99.8% winning rate against other Go programs,and defeated the European Go champion by 5 games to 0. This is the first time that a computer program has defeated a human professional player in the full-sized game of Go, a feat previously thought to be at least a decade away.

*Eric Brewer presenting on Experience with Processes and Monitors in Mesa*:

The use of monitors for describing concurrency has been much discussed in the literature. When monitors are used in real systems of any size, however, a number of problems arise which have not been adequately dealt with: the semantics of nested monitor calls; the various ways of defining the meaning of WAIT; priority scheduling; handling of timeouts, aborts and other exceptional conditions; interactions with process creation and destruction; monitoring large numbers of small objects. These problems are addressed by the facilities described here for concurrent programming in Mesa. Experience with several substantial applications gives us some confidence in the validity of our solutions.

*Ines Sombra presenting on IronFleet: Proving Practical Distributed Systems Correct*:

Distributed systems are notorious for harboring subtle bugs. Verification can, in principle, eliminate these bugs a priori, but verification has historically been difficult to apply at full program scale, much less distributed-system scale. We describe a methodology for building practical and provably correct distributed systems based on a unique blend of TLA-style state-machine refinement and Hoare-logic verification. We demonstrate the methodology on a complex implementation of a Paxos-based replicated state machine library and a lease-based sharded key-value store. We prove that each obeys a concise safety specification, as well as desirable liveness requirements. Each implementation achieves performance competitive with a reference system. With our methodology and lessons learned, we aim to raise the standard for distributed systems from “tested” to “correct.”

*Caitie McCaffrey presenting on Simple Testing Can Prevent Most Critical Failures...*:

Large, production quality distributed systems still fail periodically, and do so sometimes catastrophically, where most or all users experience an outage or data loss. We present the result of a comprehensive study investigating 198 randomly selected, user-reported failures that occurred on Cassandra, HBase, Hadoop Distributed FileSystem (HDFS), Hadoop MapReduce, and Redis, with the goal of understanding how one or multiple faults eventually evolve into a user-visible failure. We found that from a testing point of view, almost all failures require only 3 or fewer nodes to reproduce, which is good news considering that these services typically run on a very large number of nodes. However, multiple inputs are needed to trigger the failures with the order between them being important. Finally, we found the error logs of these systems typically contain sufficient data on both the errors and the input events that triggered the failure, enabling the diagnose and the reproduction of the production failures.

We found the majority of catastrophic failures could easily have been prevented by performing simple testing on error handling code – the last line of defense – even without an understanding of the software design. We extracted three simple rules from the bugs that have lead to some of the catastrophic failures, and developed a static checker, Aspirator, capable of locating these bugs. Over 30% of the catastrophic failures would have been prevented had Aspirator been used and the identified bugs fixed. Running Aspirator on the code of 9 distributed systems located 143 bugs and bad practices that have been fixed or confirmed by the developers.

**Bios**

*Evelina (Gabasova)* is a machine learning researcher working in bioinformatics, trying to reverse-engineer cancer at University of Cambridge. Outside of academia, she also speaks at developer conferences and user groups about functional programming, machine learning and data science. She writes a blog at [http://www.evelinag.com](http://www.evelinag.com/).

*Dr. (Eric) Brewer* joined Google in May 2011 and leads the company’s compute infrastructure design. He focuses on all aspects of Internet­ based systems including cloud computing, scalability, containers, and storage. As a researcher, Dr. Brewer has led projects on scalable servers, network infrastructure, IoT, and the CAP Theorem. He has also led work on technology for developing regions, with projects in India, Indonesia, and Kenya among others, and including communications, power, and health care. In 1996, he co­founded Inktomi Corporation with a Berkeley grad student and helped lead it onto the NASDAQ 100. In 2000, working with President Clinton, Dr. Brewer helped to create USA.gov, the official portal of the Federal government.

*Ines Sombra* is a Distributed Systems Engineer at Fastly, where she spends her time helping the Web go faster. Ines holds an M.S. in Computology with an emphasis on Cheesy 80’s Rock Ballads. She has a fondness for steak, fernet, and a pug named Gordo. In a previous life she was a Data Engineer. Follow Ines [@randommood](https://twitter.com/randommood).

*Caitie McCaffrey* is a Backend Brat and Distributed Systems Diva at Twitter.  Prior to that she built  services and systems that power the entertainment industry at 343 Industries, Microsoft Game Studios, and HBO.  While at 343 Industries she partnered with the eXtreme Computing Group in Microsoft Research to productionize Orleans as part of her work rewriting the Halo Services.  Caitie has a degree in Computer Science from Cornell University She maintains a blog at [CaitieM.com](https://caitiem.com/) and frequently discusses technology and entertainment on Twitter [@Caitie](https://twitter.com/caitie).

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="http://www.twosigma.com">TwoSigma</a> and host, <a href="https://qconnewyork.com/">QCon NewYork</a>, for helping to make this meetup possible.</span>
</p>

---
