---
title: The Derivative of a Regular Type is its Type of One-Hole Contexts
date: 2014-07-09
author: Brian
category: meetup
tags: types
label: Meetup NYC
label_url: http://www.meetup.com/papers-we-love/events/182798272/
presenter: Erik Hinton
presenter_url: https://twitter.com/erikhinton
description: Erik Hinton on The Derivative of a Reg. Type is its Type of One-Hole Contexts
---

We're happy to have [Erik Hinton](https://source.opennews.org/en-US/articles/model-analysis/), developer at the New York Times, presenting on [The Derivative of a Regular Type is its Type of One-Hole Contexts](http://strictlypositive.org/diff.pdf) by Conor McBride. READMORE

## Intro

Papers are generally loved for one of two reasons. Either the paper is foundational, siring a lineage of important research, or the paper is useful, guiding readers toward clever optimizations, fault-tolerant solutions, and non-intuitive hacks. "The Derivative of a Regular Type is its Type of One-Hole Contexts" is neither. Only a few papers build on McBride's work and the conclusions of the paper, though promising, haven't yet found any real employ.

This paper is lovable, fun, and important because it is a radical thought experiment in the limits of abstraction. The paper poses the question: we call data types "algebraic", so can we "do calculus" on them? Surely, the nomenclature is just coincidental? What would it even mean to take the derivative of a data type? The paper stretches algebraic data types to what should be their breaking point and then demonstrates that it's not a breaking point ay all. By considering the paper's set-up and implications, we gain a deeper understanding of types and what they abstract.

As it will turn out, you can take the derivative of data type and the result is meaningful. The derivative of an algebraic type is another data type, namely the type that can represent any specific context in the original type, any position in the original structure. This relationship is eerily similar to the relationship of functions to their derivatives (roughly, the contextual rate of change) that we all learned in high school

No previous knowledge of calculus, algebraic data types, zippers, contexts or anything else is required.

This talk will cover:

* What is an algebraic data type?
* What is a zipper and its sister structure, the one-hole context?
* How can we derive a one-hole context from any given type? (How can we represent a specific location in an arbitrarily complex tree, type, etc)
* What are the one-hole contexts of common types: the list, the binary tree, the ternary tree, and the rose tree?
* Why would anyone care?

## Bio

Erik Hinton ([@erikhinton](https://twitter.com/erikhinton)) is an interactive developer for The New York Times. His interests include building a platform for the digital humanities, subversively deploying Haskell applications when no one is watching, analytic philosophy, and the connections between medieval mystical Judaism and all of the above.

## Details

Doors open at 7 pm; the presentation will begin at 7:30 pm; and, yes, there will be beer and pizza.

After Erik presents the paper, we will open up the floor to discussion and questions.

We hope that you'll read the paper before the meetup, but don't stress if you can't.  If you have any questions, thoughts, or related information, please visit our [*github-thread*](https://github.com/papers-we-love/papers-we-love/issues/118) on the matter.

Additionally, if you have any papers you want to add to the repository above (papers that you love!), please send us a [pull request](https://github.com/papers-we-love/papers-we-love/pulls). Also, if you have any ideas/questions about this meetup or the Papers-We-Love org, just open up an issue.

## Sponsors

### Pizza & Beers

[SFX Entertainment](https://sfx.recruiterbox.com/)

### Audio & Video

[Hakka Labs](http://www.hakkalabs.co/)
