---
title: A comprehensive study of Convergent & Commutative Replicated Data Types
date: 2014-05-15
author: Brian
category: meetup
tags: eventual consistency, consensus, cap theorem, lattices, semi-lattices, operational transforms, data replication
label: Meetup NYC
label_url: http://www.meetup.com/papers-we-love/events/175964662/
presenter: Chas Emerick
presenter_url: http://cemerick.com/
description: Chas Emerick - A comp study of Convergent & Commutative Replicated Data Types
---

We're ecstatic to have Chas Emerick presenting [A comprehensive study of Convergent and Commutative Replicated Data Types](http://hal.upmc.fr/docs/00/55/55/88/PDF/techreport.pdf) by Marc Shapiro, Nuno Preguiça, Carlos Baquero, and Marek Zawirski (2011).  

## Intro

Conflict-free Replicated Data Types (CRDTs) are a formalism for providing practical data and programming primitives for use in distributed systems applications without necessitating expensive (and sometimes impractical) consensus mechanisms.  Their key characteristic is that they provide conflict-free "merging" of distributed concurrent updates given only the weak guarantees of eventual consistency. 
While this paper did not coin the term 'CRDT', it was the first to provide a comprehensive treatment of their definition, semantics, and possible construction separate from and beyond previous implementations of distributable datatypes that happened to provide CRDT-like semantics.

In the paper, the authors:

* Construct a modern taxonomy of data types that can be characterized has having desirable conflict-resolution properties given multiple distributed, concurrent actors manipulating shared data without coordination or consensus (a.k.a. "eventual consistency").
* Describe a set of formal properties necessary to implement these data types, defining both local programming interfaces and distributed replication semantics and requirements.

Related topics: Eventual consistency, consensus, CAP theorem, (semi-)lattices, Bloom(L), operational transforms, data replication

## Bio

[Chas Emerick](http://cemerick.com/) ([@cemerick](http://twitter.com/cemerick)) is a long-time contributor to the Clojure and ClojureScript languages and ecosystem, and is a coauthor of the '[Clojure Programming](http://clojurebook.com/)' book from O’Reilly. His current mission is to help build [Quilt](http://quilt.org/).

## Details

Doors open at 7 pm; the presentation will begin at 7:30 pm; and, yes, there will be beer and pizza. 

After Chas presents the paper, we will open up the floor to discussion and questions.  

We hope that you'll read the paper before the meetup, but don't stress if you can't get around to it. If you have any questions, thoughts, or related information, please visit our [*github-thread*](https://github.com/papers-we-love/papers-we-love/issues/96) on the matter.

Additionally, if you have any papers you want to add to the [repository](https://github.com/papers-we-love/papers-we-love) above, please send us a pull request. We'd love any ideas/questions about this meetup or the Papers-We-Love org addressed with a GitHub issue. Thank you!

## Slides 

<script async class="speakerdeck-embed" data-id="5e526240bf290131ae3666fdbbb32492" data-ratio="1.33159947984395" src="//speakerdeck.com/assets/embed.js"></script>

## Sponsors

### Pizza & Beers

[SFX Entertainment](https://sfx.recruiterbox.com/)

### Audio & Video

[Hakka Labs](http://www.hakkalabs.co/)
