---
title: "Gershom Bazerman on Homological Computations for Term Rewriting Systems"
date: 2017-09-29
author: Lydia Gu
category: video
tags: meetup, video
label: Video
description: "Gershom Bazerman on Homological Computations for Term Rewriting Systems"
ogp:
  og:
    description: "Gershom Bazerman on Homological Computations for Term Rewriting Systems"
  fb:
    description: "Gershom Bazerman on Homological Computations for Term Rewriting Systems"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/WdawrT-6Qzk" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - August 31, 2017

****

* **Meetup:** [https://www.meetup.com/papers-we-love/events/242063907/](https://www.meetup.com/papers-we-love/events/242063907/)
* **Paper:** [Homological Computations for Term Rewriting Systems](http://math.univ-lyon1.fr/~malbos/Art/hcTRS.pdf)
* **Slides:** [Gershom Bazerman on Homological Computations for Term Rewriting Systems](https://speakerdeck.com/paperswelove/gershom-bazerman-on-homological-computations-for-term-rewriting-systems)
* **Audio:** [Gershom Bazerman on Homological Computations for Term Rewriting Systems](https://www.mixcloud.com/paperswelove/gershom-bazerman-on-homological-computations-for-term-rewriting-systems/)

**Description**
In 1987, C. Squier wrote "[Word problems and a homological finiteness condition for monoids](http://www.sciencedirect.com/science/article/pii/0022404987901290)," which proved a fascinating result that spawned an entire field, but which is little known outside of it. The great mathematical popularizer and category theorist [John Baez sketched the ideas in 1995](https://en.wikipedia.org/wiki/John_C._Baez). We consider "word problems," which ask the equality of two terms modulo a set of equivalences, restrict ourselves to simple objects called "monoids" that many functional programmers are fond of, and ask about the decidability of equality over them. This is the same as looking at strings and asking when they are equal if you consider mappings that equate some contiguous sequences with other contiguous sequences. (Such problems arise ubiquitously in interesting computational problems -- consider for example the equivalence of sequences of patches, or of edit actions across a distributed system). The way computer scientists would think to answer this is to see if you can rewrite both sides of the equation into a single canonical form that you can compare for equality. Indeed, that's what Don Knuth and Peter Bendix did, and the result is the Knuth-Bendix algorithm, used in theorem provers and many other applications. 

But just how universal is the Knuth-Bendix algorithm? Well, Squier showed that there are finite monoids with decidable word problems that cannot be turned into such canonical rewrite procedures as Knuth-Bendix gives us. And furthermore, he showed that this result derives from considering our systems using the tools of modern algebraic topology! In particular, he showed how to calculate a homology of a monoid presentation.  

Ever since then, people have been seeking to generalize Squier's result in new and exciting ways. One of the niftiest and newest was presented last year at [FSCD](http://fscd2016.dcc.fc.up.pt/programme/acceptedPapers/), [this talk's paper](http://math.univ-lyon1.fr/~malbos/Art/hcTRS.pdf), which I love, but do not claim to fully understand. Instead of a monoid, we consider an arbitrary "algebraic theory" (say, a syntax tree of a programming language with some equalities between certain forms of trees). And we now ask not about the word problem, but just the minimum number of equalities necessary to present such a theory. The answer, which can be computed with an algorithm, comes from even more, and more generalized homology.  The purpose of this talk is to make the above understandable to a lay audience, to sketch some idea of how to think about things that arise in computer science topologically, and to provide an invitation to basic notions of [homology](https://en.wikipedia.org/wiki/Homology_(mathematics)).

**Bio**

[Gershom Bazerman](http://gbaz.github.io/) is a software developer in New York. He is an organizer of the [NY Haskell Users Group](https://www.meetup.com/NY-Haskell/), the [NY Homotopy](https://groups.google.com/forum/#!forum/hott-nyc) (or Topos) Theory Reading group, and the [Compose conference](http://www.composeconference.org/) among other things. He's written some useful and used Haskell libraries, occasionally contributed to others, as well as to the PureScript compiler, and has also helped maintain Haskell infrastructure for some time. He likes reading complicated things and trying to understand and explain them.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&mini=1&feed=%2Fpaperswelove%2Fgershom-bazerman-on-homological-computations-for-term-rewriting-systems%2F" frameborder="0" ></iframe>

**Slides**

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="596" mozallowfullscreen="true" src="//speakerdeck.com/player/779c99feecc44f9da4ad89347ede32b4" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="https://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
