---
title: "Scott Vokes on An Efficient Context-Free Parsing Algorithm"
date: 2018-05-01
author: The RZA
category: video
tags: meetup, video
label: Video
description: "Scott Vokes on An Efficient Context-Free Parsing Algorithm"
ogp:
  og:
    description: "Scott Vokes on An Efficient Context-Free Parsing Algorithm"
  fb:
    description: "Scott Vokes on An Efficient Context-Free Parsing Algorithm"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/kVxGe_uGM8g" frameborder="0" allowfullscreen></iframe>

READMORE

## San Francisco - May 1, 2018

****

* **Meetup:** [https://www.meetup.com/papers-we-love-too/events/249287324/](https://www.meetup.com/papers-we-love-too/events/249287324/)
* **Paper:** [An Efficient Context-Free Parsing Algorithm](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.138.1808)

**Description**

Scott tells us: This paper introduces the Earley algorithm, which is a fully general parsing algorithm: it's able to parse _any_ context-free grammar, including many too ambiguous or recursive for other parsers to handle without careful restructuring. Instead, it takes ambiguity in stride, and is even able to handle many realistic grammars in linear time.

I’ll provide a quick overview of parsing terminology along the way, present the main ideas of the paper (and warn about an infamous bug), and show how it also supports use cases like syntax auto-completion and error messages.

Finally, I'll introduce some other important papers that build on it -- understanding the core algorithm unlocks a whole family tree of parsing approaches. There will be a few resources for people who want to learn more about parsing in general, not just generalized parsing.

**Bio**

Among other things, [Scott Vokes](https://twitter.com/silentbicycle) is the author of theft, a property-based testing library for C. He works on the Compiler Engineering team at Fastly, where he helps make fast things safe, and safe things fast. He's previously worked on embedded systems, compilers, distributed storage systems, and architectural design software, but has always built testing tools along the way. Outside of computers, Scott loves cooking, bicycling, and electronics. He lives in Grand Rapids, MI. Follow Scott at https://twitter.com/silentbicycle
