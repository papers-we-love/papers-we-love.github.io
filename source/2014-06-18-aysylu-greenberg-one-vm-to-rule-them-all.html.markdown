---
title: One VM to Rule Them All
date: 2014-06-18
author: Brian
category: meetup
tags: vm
label: Meetup NYC
label_url: http://www.meetup.com/papers-we-love/events/178049922/
presenter: Aysylu Greenberg
presenter_url: http://aysy.lu/
description: Aysylu Greenberg on One VM to Rule Them All
---

In June, we have the pleasure of hearing Aysylu Greenberg, Software Engineer at Google and maintainer of the Clojure library [Loom](https://github.com/aysylu/loom), speaking on the paper "One VM to Rule Them All" by Thomas Wuerthinger, Christian Wimmer, et al.

## Paper

You can find the paper in the [PWL repository](https://github.com/papers-we-love/papers-we-love/blob/bc15cfbe998b9dbde6c76480f9264e968e19155d/virtual_machines/README.md) and [here](https://www.cs.purdue.edu/homes/gkrichar/papers/onward2013-wuerthinger-truffle.pdf).

## Intro 

![](http://photos1.meetupstatic.com/photos/event/6/6/c/8/600_354266312.jpeg)

The paper explains how you can write an interpreter and get an optimizing just-in-time (JIT) compiler for free. This enables language designers to focus on features without worrying about the complexities of compiler optimizations and code generation. This paper presents a Java Virtual Machine (JVM) that allows the application to control the JIT compiler behavior at runtime. We'll discuss how various programming languages can take advantage of this framework.

To intrigue compiler aficionados, the authors show how combining AST node rewriting during interpretation, optimization, and deoptimization produces high performance code from the interpreter without a language-specific compiler. In addition, they present how features of a variety of programming languages, such as JavaScript, Ruby, Python, R and others, map on the framework.

## Bio 

Aysylu Greenberg has many hobbies. By day, she works on search infrastructure at Google. For fun, she writes open-source libraries in Clojure, ponders the design of systems that deal with inaccuracies, paints and sculpts. Her curiosity for everything new and unexplored drives her to seek out cutting edge research papers. You can find [@aysylu22](https://twitter.com/aysylu22) on [github.com/aysylu](https://github.com/aysylu) and [http://aysy.lu](http://aysy.lu/).

## Details

Doors open at 7 pm; the presentation will begin at 7:30 pm; and, yes, there will be beer and pizza. 

After Aysylu presents the paper, we will open up the floor to discussion and questions.  

We hope that you'll read the paper before the meetup, but don't stress if you never get around to it, and if you have any questions, thoughts, or related information, please visit our [*github-thread*](https://github.com/papers-we-love/papers-we-love/issues/102) on the matter.

Additionally, if you have any papers you want to add to the repository above, please send us a [pull request](https://github.com/papers-we-love/papers-we-love/pulls). Also, if you have any ideas/questions about this meetup or the Papers-We-Love org, just open up an issue.

## Slides

<iframe src="//www.slideshare.net/slideshow/embed_code/36108599" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/aysylu/pwl-one-vm-to-rule-them-all" title="PWL: One VM to Rule Them All" target="_blank">PWL: One VM to Rule Them All</a> </strong> from <strong><a href="http://www.slideshare.net/aysylu" target="_blank">Aysylu Greenberg</a></strong> </div>

## Bonus Video

<iframe width="420" height="315" src="//www.youtube.com/embed/kmQUB-5cEgM" frameborder="0" allowfullscreen></iframe>
