---
title: "The Papers: Christopher Meiklejohn's A Brief History of Chain Replication"
date: 2015-12-10
tags: meetup, paperlist, topic, chainreplication, sanfrancisco
label: Topic
category: topic
author: Zeeshan
description: "The Papers: Christopher Meiklejohn's A Brief History of Chain Replication"
ogp:
  og:
    description: "The Papers: Christopher Meiklejohn's A Brief History of Chain Replication"
  fb:
    description: "The Papers: Christopher Meiklejohn's A Brief History of Chain Replication"
---

**Meetup Spotlight:** [http://bit.ly/1QelqoU](http://bit.ly/1QelqoU)

On December 10, 2015, [Christopher Meikljohn](https://christophermeiklejohn.com/) is presenting at [Papers We Love - San Francisco](http://www.meetup.com/papers-we-love-too) on the topic (and history) of **Chain Replication**, a data replication technique that "promises a high throughput, linearizable, robust replication technique with minimal overhead to tolerate failures with only f+1 nodes[0]."

READMORE

Here's a look at some of the papers that will be discussed, starting with the original work:

<img src="/assets/images/cmeik_fig1.svg" height="270" alt="Figure from Chain Replication for Supporting High Throughput and Availability" />
<img src="/assets/images/cmeik_fig2.svg" height="270" alt="Figure from Chain replication in theory and in practice" />

**The List:**

* [Chain Replication for Supporting High Throughput and Availability](http://www.cs.cornell.edu/home/rvr/papers/osdi04.pdf)
* [FAWN: A fast array of wimpy nodes](http://www.sigops.org/sosp/sosp09/papers/andersen-sosp09.pdf)
* [Object storage on CRAQ: High-throughput chain replication for read-mostly workloads](http://sns.cs.princeton.edu/docs/craq-usenix09.pdf)
* [Chain replication in theory and in practice](http://www.snookles.com/scott/publications/erlang2010-slf.pdf)
* [HyperDex: A Distributed, Searchable Key-Value Store](http://hyperdex.org/papers/hyperdex.pdf)
* [ChainReaction: a Causal+ Consistent Datastore based on Chain Replication](http://eurosys2013.tudos.org/wp-content/uploads/2013/paper/Almeida.pdf)
* [Leveraging sharding in the design of scalable replication protocols](http://www.ymsir.com/papers/sharding-socc.pdf)

---

### [Chain Replication for Supporting High Throughput and Availability](http://www.cs.cornell.edu/home/rvr/papers/osdi04.pdf)

**Authors:** Robbert van Renesse, Fred B Schneider
**Year:** 2004

**Published-in:** Proceedings of the 6th Conference on Symposium on Opearting Systems Design & Implementation

**Abstract:**

Chain replication is a new approach to coordinating clusters of fail-stop storage servers. The approach is intended for supporting large-scale storage services that exhibit high throughput and availability without sacrificing strong consistency guarantees. Besides outlining the chain replication protocols themselves, simulation experiments explore the performance characteristics of a prototype implementation. Throughput, availability, and several object-placement strategies (including schemes based on distributed hash table routing) are discussed.

---

### [FAWN: A fast array of wimpy nodes](http://www.sigops.org/sosp/sosp09/papers/andersen-sosp09.pdf)

**Authors:** David G. Andersen, Jason Franklin, Michael Kaminsky, Amar Phanishayee, Lawrence Tan, Vijay Vasudevan
**Year:** 2009

**Published-in:** Proceedings of the ACM SIGOPS 22nd symposium on Operating systems principles

**Abstract:**
This paper presents a new cluster architecture for low-power data- intensive computing. FAWN couples low-power embedded CPUs to small amounts of local flash storage, and balances computation and I/O capabilities to enable efficient, massively parallel access to data. The key contributions of this paper are the principles of the FAWN architecture and the design and implementation of FAWN-KV—a consistent, replicated, highly available, and high-performance key- value storage system built on a FAWN prototype. Our design centers around purely log-structured datastores that provide the basis for high performance on flash storage, as well as for replication and consistency obtained using chain replication on a consistent hashing ring. Our evaluation demonstrates that FAWN clusters can handle roughly 350 key-value queries per Joule of energy—two orders of magnitude more than a disk-based system.

---

### [Object storage on CRAQ: High-throughput chain replication for read-mostly workloads](http://sns.cs.princeton.edu/docs/craq-usenix09.pdf)

**Authors:** Jeff Terrace and Michael J. Freedman
**Year:** 2009

**Published-in:** Proceedings of the 2009 conference on USENIX Annual technical conference - USENIX'09

**Abstract:**
Massive storage systems typically replicate and partition data over many potentially-faulty components to provide both reliability and scalability. Yet many commerciallydeployed systems, especially those designed for interactive use by customers, sacrifice stronger consistency properties in the desire for greater availability and higher throughput. This paper describes the design, implementation, and evaluation of CRAQ, a distributed object-storage system that challenges this inflexible tradeoff. Our basic approach, an improvement on Chain Replication, maintains strong consistency while greatly improving read throughput. By distributing load across all object replicas, CRAQ scales linearly with chain size without increasing consistency coordination. At the same time, it exposes noncommitted operations for weaker consistency guarantees when this suffices for some applications, which is especially useful under periods of high system churn. This paper explores additional design and implementation considerations for geo-replicated CRAQ storage across multiple datacenters to provide locality-optimized operations. We also discuss multi-object atomic updates and multicast optimizations for large-object updates.

---

### [Chain replication in theory and in practice](http://www.snookles.com/scott/publications/erlang2010-slf.pdf)

**Authors:** Scott Lystig Fritchie
**Year:** 2010

**Published-in:** Proceedings of the 9th ACM SIGPLAN workshop on Erlang - Erlang '10

**Abstract:**
When implementing a distributed storage system, using an algo- rithm with a formal definition and proof is a wise idea. However, translating any algorithm into effective code can be difficult be- cause the implementation must be both correct and fast. This paper is a case study of the implementation of the chain replication protocol in a distributed key-value store calledHibari. In theory, the chain replication algorithmis quite simple and should be straightforward to implement correctly. In practice, however, there were many implementation details that had effects both profound and subtle. The Erlang community, as well as distributed systems implementors in general, can use the lessons learned with Hibari (specifically in areas of performance enhancements and failure detection) to avoid many dangers that lurk at the interface between theory and real-world computing.

---

### [HyperDex: A Distributed, Searchable Key-Value Store](http://hyperdex.org/papers/hyperdex.pdf)

**Authors:** Robert Escriva, Bernard Wong, Emin Gün Sirer
**Year:** 2012

**Published-in:** Computer Communication Review

**Abstract:**
Distributed key-value stores are now a standard component of high-performance web services and cloud computing applications. While key-value stores offer significant performance and scalability advantages compared to traditional databases, they achieve these properties through a restricted API that limits object retrieval an object can only be retrieved by the (primary and only) key under which it was inserted. This paper presents HyperDex, a novel distributed key-value store that provides a unique search primitive that enables queries on secondary attributes. The key insight behind HyperDex is the concept of hyperspace hashing in which objects with multiple attributes are mapped into a multidimensional hyperspace. This mapping leads to efficient implementations not only for retrieval by primary key, but also for partially-specified secondary attribute searches and range queries. A novel chaining protocol enables the system to achieve strong consistency, maintain availability and guarantee fault tolerance. An evaluation of the full system shows that HyperDex is 12-13x faster than Cassandra and MongoDB for finding partially specified objects. Additionally, HyperDex achieves 2-4x higher throughput for get/put operations.

---

### [ChainReaction: a Causal+ Consistent Datastore based on Chain Replication](http://eurosys2013.tudos.org/wp-content/uploads/2013/paper/Almeida.pdf)

**Authors:** S&eacute;rgio Almeida, Jo&atilde;o Leit&atilde;o, Lu&iacute;s Rodrigues
**Year:** 2013

**Published-in:** Proceedings of The European Professional Society on Computer Systems (EuroSys)

**Abstract:**
This paper proposes a Geo-distributed key-value datastore, named ChainReaction, that offers causal+ consistency, with high performance, fault-tolerance, and scalability. ChainReaction enforces causal+ consistency which is stronger than eventual consistency by leveraging on a new variant of chain replication.We have experimentally evaluated the benefits of our approach by running the Yahoo! Cloud Serving Benchmark. Experimental results show that ChainReaction has better performance in read intensive workloads while offering competitive performance for other workloads. Also we show that our solution requires less metadata when compared with previous work.

---

### [Leveraging sharding in the design of scalable replication protocols](http://www.ymsir.com/papers/sharding-socc.pdf)

**Authors:** Hussam Abu-Libdeh, Robbert van Renesse, Ymir Vigfusson
**Year:** 2013

**Published-in:** Proceedings of the 4th annual Symposium on Cloud Computing

**Abstract:**
Most if not all datacenter services use sharding and repli- cation for scalability and reliability. Shards are more-or- less independent of one another and individually repli- cated. In this paper, we challenge this design philosophy and present a replication protocol where the shards inter- act with one another: A protocol running within shards ensures linearizable consistency, while the shards inter- act in order to improve availability.We provide a specifi- cation for the protocol, prove its safety, analyze its live- ness and availability properties, and evaluate a working implementation.

---

#### Other References

* [Papers We Love - Seattle](http://www.meetup.com/Papers-We-Love-Seattle/)'s David Murray on Chain Replication for Supporting High Throughput and Availability - [Video](https://www.youtube.com/watch?v=nEbD-qutsKo) : [Meetup](http://bit.ly/1ITPeQ8)

* [Formalizing the Chain Replication Protocol](http://www.nuprl.org/FDLcontentAUXdocs/ChainRepl/) -
This book collects materials used in the formalization of an important distributed algorithm, by Schneider and van Renesse, called Chain Replication. The chain replication algorithm provides a fault-tolerant distributed storage system and guarantees a strong consistency property. The material here includes: the original Schneider and van Renesse paper; a summary of the formalization method, by Bickford & Guaspari; a detailed outline of the formalization by Bickford; and a Nuprl library providing a formal account based on the Logic of Events described by Bickford and Constable.

* [Mendeley Tag for *cmjchainreplication*](https://www.mendeley.com/groups/7644501/papers-we-love/papers/added/0/tag/chain_replication/) - More resources and information about the papers mentioned here.

---

[0] [http://www.meetup.com/papers-we-love-too/events/224178870/](http://www.meetup.com/papers-we-love-too/events/224178870/)

---
