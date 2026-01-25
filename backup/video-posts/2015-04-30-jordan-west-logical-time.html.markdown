---
title: "Jordan West on Logical Time"
date: 2015-04-30
author: Joshua
category: video
tags: meetup, video
label: Video
description: "Logical Time by Jordan West on 2015-04-30"
ogp:
og:
description: "Logical Time by Jordan West on 2015-04-30"
fb:
description: "Logical Time by Jordan West on 2015-04-30"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/A22wSN9WEpg" frameborder="0" allowfullscreen></iframe>

READMORE

## San Francisco - April 30, 2015

**Jordan West** on *Logical Time*

**Nathan Taylor** on [Your computer is already a distributed system. Why isn’t your OS?](http://www.barrelfish.org/barrelfish_hotos09.pdf)

**Meetup:** [http://www.meetup.com/papers-we-love-too/events/212148242/](http://www.meetup.com/papers-we-love-too/events/212148242/)

**Description**

**[Jordan West](https://twitter.com/_jrwest)** gives us a survey on Logical Time with three papers that cover from 1978 to the present day:

1. [Time, Clocks, and the Ordering of Events in a Distributed System](http://research.microsoft.com/en-us/um/people/lamport/pubs/time-clocks.pdf) - Leslie Lamport - 1978

2. [Virtual Time and Global States of Distributed Systems](https://www.vs.inf.ethz.ch/publ/papers/VirtTimeGlobStates.pdf) - Friedmann Mattern - 1988

3. [Dotted Version Vectors: Efficient Causality Tracking for Distributed Key-Value Stores](http://haslab.uminho.pt/psa/files/dvv-arxiv.pdf) - Prequica et al - 2012

From **Jordan West**:

If you are looking to narrow down the homework, I suggest only reading paper #2, it covers the issues w/ #1, and #3 is an extension. All the maths and such can be found in #2.

Jordan West is a distributed systems practitioner and open source contributor with a passion for functional programming. He recently worked on the core distributed systems and key/value storage components of Riak, an open-source distributed datastore, implementing major features such as a new reliable broadcast protocol and replicated metadata store. He now spends time working on other distributed systems include Apache Cassandra. When not working on distributed databases or reading papers you can usually find Jordan outside with playing with his dogs.

From **[Nathan Taylor](https://twitter.com/dijkstracula)**:

This is one in a long line of papers advocating for a loosely-coupled, service-oriented operating system architecture, an argument that extends back to the dawn of systems research.  Alternative OSs like microkernels have long been considered more stable and easier to reason about by the systems community, but the performance overhead that comes with running them means typically our OSs still resemble the ones from the '60s.  The authors have spun the "it will be too slow" argument on its head by extrapolating hardware trends and adopting terminology from the distributed systems community, and end up making a compelling case for their design not only being the _only_ path forward, but the time is now to begin adopting their techniques.  The paper is punchy, argues its point cogently, and served as a springboard for further work by the same group of researchers.

Nathan is currently working on low-latency content distribution at Fastly and has previously hacked on improving the performance of language runtimes and OS hypervisors. His first exposure to OS research came as a graduate student at the University of British Columbia.

---

<img class="left no-shadow" alt="Fastly" style="width: 180px" src="http://mediaserver.pulse2.com/wp-content/uploads/2014/09/Fastly-Logo.png" /><br />
The <strong>San Francisco Chapter</strong> would like to give special thanks to [Fastly](https://www.fastly.com) for sponsoring the April meetup.

---
