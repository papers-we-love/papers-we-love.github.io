---
title: "Nathan Taylor / Chris Meiklejohn on OS Scalability & Chain Replication"
date: 2015-12-10
author: Joshua
category: video
tags: meetup, video
label: Video
description: "OS Scalability & Chain Replication by Nathan Taylor / Chris Meiklejohn on 2015-12-10"
ogp:
og:
description: "OS Scalability & Chain Replication by Nathan Taylor / Chris Meiklejohn on 2015-12-10"
fb:
description: "OS Scalability & Chain Replication by Nathan Taylor / Chris Meiklejohn on 2015-12-10"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/kaig7CL4-KU" frameborder="0" allowfullscreen></iframe>

READMORE

## San Francisco - December 10, 2015

**Nathan Taylor** on OS Scalability

**Chris Meiklejohn** on Chain Replication

**Papers:**

* [Corey: An Operating system for Many Cores](https://www.usenix.org/legacy/event/osdi08/tech/full_papers/boyd-wickizer/boyd_wickizer.pdf)
* [An analysis of Linux scalability to many cores](https://pdos.csail.mit.edu/papers/linux:osdi10.pdf)
* [Object Storage on CRAQ](https://www.usenix.org/legacy/event/usenix09/tech/full_papers/terrace/terrace.pdf)
* [FAWN: A Fast Array of Wimpy Nodes](http://www.sigops.org/sosp/sosp09/papers/andersen-sosp09.pdf)
* [Chain Replication in Theory and in Practice](http://www.snookles.com/scott/publications/erlang2010-slf.pdf)
* [HyperDex: A Distributed, Searchable Key-Value Store](http://hyperdex.org/papers/hyperdex.pdf)
* [ChainReaction: a Causal + Consistent Datastore based on Chain Replication](http://eurosys2013.tudos.org/wp-content/uploads/2013/paper/Almeida.pdf)
* [Leveraging Sharding in the Design of Scalable Replication Protocols](http://www.ymsir.com/papers/sharding-socc.pdf)


**Meetup:** [http://www.meetup.com/papers-we-love-too/events/224178870/](http://www.meetup.com/papers-we-love-too/events/224178870/)

**Description**

**Nathan Taylor**: This is a story that spans two low-level systems papers. While on the surface it's all about how to make operating systems scale, it's also a story about how the same researchers can tackle a problem from different angles, succeed each time, and yet end up with very different conclusions.

At OSDI '08 Silas Boyd-Swicker et al published Corey: An Operating system for Many Cores, which advocated for a fundamental restructuring of the operating system; they observed that scalability problems often manifest because of data unintentionally shared between CPUs, so their research OS provided improved abstractions for programmers to inform the kernel about what is supposed to be local to a particular core or thread.

At the subsequent OSDI, though, the same research lab published an analysis of Linux scalability to many cores, where they present the same problem -- kernel scalability-- but instead tackled it by finding individual bottlenecks and implementing tiny point fixes, mostly-hidden from application code.  This inverted approach worked so well that in their abstract they arguably recanted the conclusion from their earlier work: "...there is no scalability reason to give up on traditional OS organizations yet."

These papers, together, are interesting to me for a bunch of reasons.  The former advocates for better application control of data sharing by exposing new abstraction primitives, whereas the OS remains in the latter paper an opaque layer where we're to be mostly content at not having to look underneath the hood.  Seeing two seemingly opposing philosophies work equally well was a surprising result to me.  It's also interesting how the tacit assumptions we make can cause wildly different systems to be built.  In one, it's treated as axiomatic that a new software architecture is needed, whereas in the other the very first sentence questions the "traditional architectures don't scale" assumption.  And, of course, when so many people build careers out of asserting that There's Only One Way To Solve This Problem, it's refreshing to see the same group of researchers try different approaches in such quick succession.

Nathan is currently working on low-latency content distribution at Fastly and has previously hacked on improving the performance of language runtimes and OS hypervisors. His first exposure to OS research came as a graduate student at the University of British Columbia.

**Chris Meiklejohn**: Chain replication promises a high throughput, linearizable, robust replication technique with minimal overhead to tolerate failures with only f+1 nodes. But, what's the reason for so many systems choosing alternative techniques such as quorum-based or state machine replication? In this talk, we talk through a history of chain replication, starting with the original work from 2004 by van Renesse and Schneider. We will look at the various systems built using chain replication: Hibari, FAWN-KV, and CRAQ. We'll explore safer designs of chain replication, such as the elastic replication work in 2013, and finally look a new and unique designs of chain replication, such as Basho's Machi system.

[Christopher Meiklejohn](https://twitter.com/cmeik) is a Senior Software Engineer with Machine Zone, Inc. working on distributed systems. Previously, Christopher worked at Basho Technologies, Inc. on the distributed key-value store, Riak. In his spare time, Christopher develops a programming language for distributed computation, called Lasp. Christopher is starting his Ph.D. studies at the Université catholique de Louvain in Belgium in 2016. [http://christophermeiklejohn.com/](http://christophermeiklejohn.com/)

---

<img class="left no-shadow" alt="Fastly" style="width: 180px" src="http://mediaserver.pulse2.com/wp-content/uploads/2014/09/Fastly-Logo.png" /><br />
The <strong>San Francisco Chapter</strong> would like to give special thanks to [Fastly](https://www.fastly.com) for sponsoring the December meetup.
