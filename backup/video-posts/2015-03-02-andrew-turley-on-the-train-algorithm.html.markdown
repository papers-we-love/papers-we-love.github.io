---
title: Andrew Turley on the Train Algorithm - New York City 2/23
date: 2015-03-02
tags: meetup, video, newyork
label: Video
category: video
author: Darren
description: "Video: Andrew Turley - Incremental Mature Garbage Collection Using the Train Algorithm, NYC February 23, 2015"
ogp:
  og:
    description: "Video: Andrew Turley - Incremental Mature Garbage Collection Using the Train Algorithm"
  fb:
    description: "Video: Andrew Turley - Incremental Mature Garbage Collection Using the Train Algorithm"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/kpW4lCwQWHc" frameborder="0" allowfullscreen></iframe>

READMORE

**Andrew Turley** presented [_Incremental Mature Garbage Collection Using the Train Algorithm_](https://github.com/papers-we-love/papers-we-love/blob/master/garbage_collection/incremental_mature_garbage_collection_using_the_train_algorithm.pdf?raw=true) by Jacob Seligmann & Steffen Grarup at the February 23, 2015 Papers We Love Meetup held at the Tumblr offices.

The Train Algorithm is an incremental generational garbage collector that was designed to deal with the long and unpredictable pause times caused by other algorithms. It does this by grouping objects together on "cars" in "trains". The algorithm provides a strategy for moving objects from the younger generation into different cars, moving objects from one car to another, and collecting cars and trains. It was first described by Hudson and Moss in the paper "Incremental
Collection of Mature Objects".

**Andrew Turley** ([@casio_juarez](http://twitter.com/casio_juarez)) is a lead software engineer on the platform team at [TheLadders](http://dev.theladders.com), where he builds infrastructure by linking Storm topologies together using RabbitMQ. He has also had numerous professional brushes with lower levels of the software stack, including building embedded systems for processing audio at DigiDesign, and helping to improve the performance of iOS at
Apple.

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;" /></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank our platinum sponsor <a href="http://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---

**Additional resources**

- [mcca60] John McCarthy. Recursive functions of symbolic expressions and their computation by machine, Part I. Communications of the ACM, 3(4):184-195, April 1960.
- [bish77] Peter B. Bishop. Computer Systems with a Very Large Address Space and Garbage Collection. PhD thesis, MIT Laboratory for Computer Science, May 1977. Technical report MIT/LCS/TR-178.
- [bake78] Henry G. Baker. List processing in real-time on a serial computer. Communications of the ACM, 21(4):280-294, 1978. Also AI Laboratory Working Paper 139, 1977.
- [lieb83] Henry Lieberman and Carl E. Hewitt. A real-time garbage collector based on the lifetimes of objects. Communications of the ACM, 26(6):419-429, June 1983. Also report TM-184, Laboratory for Computer Science, MIT, Cambridge, MA, July 1980 and AI Lab Memo 569, 1981.
- [moon84] David A. Moon. Garbage collection in a large LISP system. In Steele [LFP84], 1984, pages 235-245
- [huds92] Richard L. Hudson and J. Eliot B. Moss. Incremental collection of mature objects. In Bekkers and Cohen [IWMM92], 1992, pages 388-403
- [seli95] Jacob Seligmann and Steffen Grarup. Incremental mature garbage collection using the train algorithm. In Nierstrasz [ECOOP95], 1995, pages 235-252.
- [gart05a] Alex Garthwaite. Making the Trains Run On Time. PhD thesis, University of Pennsylvania, 2005.
