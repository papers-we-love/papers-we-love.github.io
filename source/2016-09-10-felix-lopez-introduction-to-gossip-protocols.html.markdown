---
title: "Félix López on Epidemic Broadcast Trees"
date: 2016-09-10
author: Sean
category: video
tags: meetup, video
label: Video
description: "Félix López on Epidemic Broadcast Trees"
ogp:
  og:
    description: "Félix López on Epidemic Broadcast Trees"
  fb:
    description: "Félix López on Epidemic Broadcast Trees"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/lhGZNZLcfo0" frameborder="0" allowfullscreen></iframe>

READMORE

## Madrid - April 6, 2016

* **Meetup:** [http://www.meetup.com/Papers-We-Love-Madrid/events/229616859/](http://www.meetup.com/Papers-We-Love-Madrid/events/229616859/)

### Félix López on Epidemic Broadcast Trees

While I was working on the presentation for Plumtree I realized that the gossip introduction is itself quite long, so I'm going to split the talk in two. In this first one I will introduce Gossip protocols and I will go over these papers:

* [A. Demers, D. Greene, C. Hauser, W. Irish, J. Larson, S. Shenker, H. Sturgis, D. Swinehart, and D. Terry. “Epidemic Algorithms for Replicated Database Maintenance.” In Proc. Sixth Symp. on Principles of Distributed Computing, pp. 1–12, Aug. 1987.](http://bitsavers.informatik.uni-stuttgart.de/pdf/xerox/parc/techReports/CSL-89-1_Epidemic_Algorithms_for_Replicated_Database_Maintenance.pdf)
* [Ken Birman. The Promise, and Limitations, of Gossip Protocols. ACM SIGOPS Oper. Syst. Rev., 41(5):8–13, October 2007](http://dl.acm.org/citation.cfm?id=1317382)
* [Gossip-based Protocols for Large-scale Distributed Systems. Márk Jelasity, 2013](http://www.inf.u-szeged.hu/~jelasity/dr/doktori-mu.pdf)

Although some parts of the presentation refer to these:

* J. Leitão, J. Pereira, and L. Rodrigues. Epidemic broadcast trees. In Huai, J. and Baldoni, R. and Yen, I., editor, IEEE International Symposium On Reliable Distributed Systems, pages 301–310. IEEE Computer Society, 2007
* Ali Saidi and Mojdeh Mohtashemi. Minimum-cost first-push-then-pull gossip algorithm. IEEE Wireless Communications and Networking Conference, WCNC, pages 2554–2559, 2012
* JELASITY, M., GUERRAOUI, R., KERMARREC, A.-M., AND VAN STEEN, M. 2004. The peer sampling service: Experimental evaluation of unstructured gossip-based implementations. In Middleware 2004, H.-A. Jacobsen, Ed. Lecture Notes in Computer Science, vol. 3231. Springer-Verlag, 79–98.
* [Amazon S3 Outage](http://status.aws.amazon.com/s3-20080720.html)
* [Datastax - Internode Communications (Gossip)](http://docs.datastax.com/en/cassandra/3.0/cassandra/architecture/archGossipAbout.html)
* [Consul - Gossip Protocol](https://www.consul.io/docs/internals/gossip.html)
* A Gossip-Style Failure Detection Service: Robbert van Renesse, Yaron Minsky, and Mark Hayden*; Dept. of Computer Science, Cornell University; 4118 Upson Hall, Ithaca, NY 14853
* Gupta, Indranil, Chandra, Tushar D., and Goldszmidt, German S. On scalable and efficient distributed failure detectors. In Proceedings of the Twentieth Annual ACM Symposium on Principles of Distributed Computing, PODC ’01, pp. 170–179,New York, NY, USA, 2001. ACM. ISBN[masked]-9. doi:[masked]/383962.384010. URL http://doi.acm.org/10.1145/383962.384010
* Montresor, A.: Intelligent Gossip. In: Studies on Computational Inteligence, Intelligent Distributed Computing, Systems and Applications, Springer, Heidelberg (2008)
* On disseminating information reliably without broadcasting. Proceedings of the International Conference on Distributed Computing Systems (1987), pp. 74–81
* Brenda Baker and Robert Shostak. Gossips and telephones. Discrete Mathematics, 2(3):191–193, June 1972. http://www.inf.u-szeged.hu/~jelasity/ddm/gossip.pdf

We will talk about the paper "Epidemic Broadcast Trees" by J. Leitão, J. Pereira, and L. Rodrigues.

This paper proposes an integrated broadcast scheme that combines both Gossip protocols and deterministic tree-based protocols. The paper proposes a new protocol "Plumtree", a derivative of which is now used by Riak for gossiping bucket properties.
