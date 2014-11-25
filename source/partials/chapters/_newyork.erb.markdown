<article class="chapter">
<section class="primary">
# New York Chapter

![peoples](http://photos1.meetupstatic.com/photos/event/a/7/0/0/600_358182752.jpeg) What was the last paper within the realm of computing you read and loved? What did it inspire you to build or tinker with? Come share the ideas in an awesome academic/research paper with fellow engineers, programmers, and paper-readers. Lead a session and show off code that you wrote that implements these ideas or just give us the lowdown about the paper (because of HARD MATH!). Otherwise, just come, listen, and discuss.

As the original Papers We Love chapter, we've been helping New Yorkers scratch their paper reading itch for most of 2014. We welcome everyone from the programming community for an evening of ideas, vibrant discussions and hanging out with your fellow travellers.

The **New York Chapter** meets monthly in the Flatiron District at <a href="http://maps.google.com/maps?f=q&hl=en&q=40.739433,-73.989240">Viggle</a> - 902 Broadway, 11<sup>th</sup> floor, New York, NY.

**Our meets fill up fast**, so please make sure to RSVP only if you plan on attending. You can find our schedule and RSVP [here on Meetup.com](http://www.meetup.com/papers-we-love/").

Papers We Love has a **[Code of Conduct](https://github.com/papers-we-love/papers-we-love/blob/master/CODE_OF_CONDUCT.md)**. Please contact one of the Meetup's organizers if anyone is not following it. Be good to each other and to the PWL community!

## Chapter Meetups

### On the resemblance and containment of documents
<span class="meta">
Speaker: [Jeff Larson](http://www.propublica.org/site/author/jeff_larson)
Date: [TBD](http://www.meetup.com/papers-we-love/events/214029542/)
Links: [Paper](http://gatekeeper.dec.com/ftp/pub/dec/SRC/publications/broder/positano-final-wpnums.pdf)
</span>

Increasingly Journalists are dealing with ever larger document dumps, and in order to find interesting stories in these troves, they have to cluster the documents to separate the wheat from the chaff. The size of these dumps often means that traditional algorithms either are too complex and take too long, or they rely on apriori constants like the number of clusters to search for.

Jeff Larson will present a novel algorithm called minhashing that was invented at AltaVista in order to loosely cluster similar documents. The paper "On the resemblance and containment of documents" relies on a hash collisions to create document fingerprints and shows that documents can be clustered in linear time without knowledge of the entire document corpus. This algorithm has been a key tool in some of ProPublica's biggest investigations, and has allowed reporters to shine light on topics such as political astroturfing and international money laundering.

<p class="chapter-sponsor">
December Sponsor
<a href="http://kisspatent.com/" class="sponsor"><img class="sponsor" src="/images/KISSPatent_Logo-fitted.png" title="KISSPatent" /></a>
</p>


### An Axiomatic Basis for Computer Programming
<span class="meta">
Speaker: [Jean Yang](http://jeanyang.com/)
Date: [November 18, 2014](http://www.meetup.com/papers-we-love/events/214400572/)
Links: [Paper](http://www.cs.cmu.edu/~crary/819-f09/Hoare69.pdf)
</span>

![Jean Yang](http://photos1.meetupstatic.com/photos/event/a/7/d/f/600_431862975.jpeg)Our lives now run on software. Bugs are becoming not just annoyances for software developers, but sources of potentially catastrophic failures. A careless programmer mistake could leak our social security numbers or crash our cars. While testing provides some assurance, it is difficult to test all possibilities in complex systems--and practically impossible in concurrent systems. For the critical systems in our lives, we should demand mathematical guarantees that the software behaves the way the programmer expected.

A single paper influenced much of the work towards providing these mathematical guarantees. C.A.R. Hoare’s seminal 1969 paper “An Axiomatic Basis for Computer Programming” introduces a method of reasoning about program correctness now known as Hoare logic. In this paper, Hoare provides a technique that 1) allows programmers to express program properties and 2) allows these properties to be automatically checked. These ideas have influenced decades of research in automated reasoning about software correctness.

<p class="chapter-sponsor">
November Sponsor
<a href="http://dev.theladders.com/" class="sponsor"><img class="sponsor" src="/images/ladders_logo.jpg" title="The Ladders Dev Team" /></a>
</p>


### The Chubby lock service
<span class="meta">
Speaker: [Camille Fournier](https://www.renttherunway.com/team/camillefournier)
Date: [October 20, 2014](http://www.meetup.com/papers-we-love/events/203968372/)
Links: [Paper](http://static.googleusercontent.com/media/research.google.com/en/us/archive/chubby-osdi06.pdf) **|** [Slides](https://speakerdeck.com/paperswelove/camille-fournier-on-the-chubby-lock-service-for-loosely-coupled-distributed-systems)
</span>

![camille fournier](http://photos3.meetupstatic.com/photos/event/c/e/4/c/600_424852812.jpeg) Distributed consensus is often discussed in terms of algorithms: Paxos, ZAB, RAFT, etc. But while the algorithms may be more or less mind-bending, for me the more interesting aspect of distributed consensus is creating systems that support it for the general use case. This paper, on Google's Chubby lock service, is the story of happens when a system stops being a polite theory, and starts getting real-world use.

To anyone who has worked in depth as a distributed systems engineer, Chubby is a beautiful paper. It is not a paper about algorithms and their limits, or a toy fringe system created by grad students to test a hypothesis. It is a paper that describes the real tradeoffs that real systems engineers make when designing something to solve a large set of problems well enough. This paper shows the key insights that the authors had as to how such a system might be used, and awareness of what it should do well, and what it should not try to do well. It details how Chubby was designed, but then goes further to describe how it ended up being used when released to the wild, and the surprises and consequences of these design decisions.

<p class="chapter-sponsor">
October Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### Crossing the Gap from Imperative to Functional Programming through Refactoring
<span class="meta">
Speaker: [Peter Burka](https://twitter.com/pburka)
Date: [September 23, 2014](http://www.meetup.com/papers-we-love/events/203968372/)
Links: [Paper](http://dig.cs.illinois.edu/papers/lambdaRefactoring.pdf) **|** [Slides](https://speakerdeck.com/paperswelove/peter-burka-on-crossing-the-gap-from-imperative-to-functional-programming-through-refactoring) **|** [Video](http://www.hakkalabs.co/articles/crossing-gap-imperative-functional-programming-refactoring)
</span>

![peter burka](http://photos4.meetupstatic.com/photos/event/3/9/9/6/600_413534742.jpeg) The introduction of lambdas to Java 8 might be the most significant change to the Java language since Java 2 was released in 1998. Lambdas and the accompanying functional operations like map and filter promise to allow Java programmers to write clearer, simpler code, and to take better advantage of parallelism.

While developers of new code will be able to start using the features immediately, what should we do with the billions of lines of code that have already been written? This paper proposes that we can automatically translate the existing body of Java code to make use of the new features.  This improves the readability of the old code, maintains consistency between new and old code, and potentially improves performance.

<p class="chapter-sponsor">
September Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### The LCA Problem Revisited
<span class="meta">
Speaker: [Leif Walsh](https://twitter.com/leifwalsh)
Date: [August 17, 2014](http://www.meetup.com/papers-we-love/events/184704082/)
Links: [Paper](http://www.ics.uci.edu/~eppstein/261/BenFar-LCA-00.pdf) | [Video](http://www.hakkalabs.co/articles/compsci-talks-lca-problem-revisited)
<span>

![leif walsh](http://photos1.meetupstatic.com/photos/event/6/1/6/e/600_404604942.jpeg) My favorite problems are always those with the highest ratio of difficulty in solving to difficulty in stating.  The lowest common ancestor problem exemplifies this.  It was first stated in 1973, and can be described to anyone in two sentences, or with one sentence and a picture.  But it took 11 years before an optimal solution was discovered, and another 16 before an understandable and implementable solution with the same bounds was presented, in this paper, The LCA Problem Revisited.  This problem is furthermore satisfying because its bounds are so tight: pre-processing takes as long as just reading the input, and queries are constant time.

The LCA Problem Revisited is a wonderfully curated journey through a deceptively simple problem that comes together in the end in a beautiful way, and it uses techniques that are powerful in plenty of other places.  Plus, it solves another bonus problem along the way!

<p class="chapter-sponsor">
August Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### The Derivative of a Regular Type is its Type of One-Hole Contexts
<span class="meta">
Speaker: [Erik Hinton](https://twitter.com/erikhinton)
Date: [July 9, 2014](http://www.meetup.com/papers-we-love/events/184704082/)
Links: [Paper](http://strictlypositive.org/diff.pdf) | [Video](https://www.youtube.com/watch?v=8CXODALwjRc)
</span>

![erik hinton](https://dl.dropbox.com/s/ftebi8q2lvpfy8b/Screenshot%202014-11-09%2013.13.18.png?dl=0)Papers are generally loved for one of two reasons. Either the paper is foundational, siring a lineage of important research, or the paper is useful, guiding readers toward clever optimizations, fault-tolerant solutions, and non-intuitive hacks. "The Derivative of a Regular Type is its Type of One-Hole Contexts" is neither. Only a few papers build on McBride's work and the conclusions of the paper, though promising, haven't yet found any real employ.

This paper is lovable, fun, and important because it is a radical thought experiment in the limits of abstraction. The paper poses the question: we call data types "algebraic", so can we "do calculus" on them? Surely, the nomenclature is just coincidental? What would it even mean to take the derivative of a data type? The paper stretches algebraic data types to what should be their breaking point and then demonstrates that it's not a breaking point ay all. By considering the paper's set-up and implications, we gain a deeper understanding of types and what they abstract.

<p class="chapter-sponsor">
July Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### One VM to Rule Them All
<span class="meta">
Speaker: [Aysylu Greenberg](http://aysy.lu/)
Date: [June 18, 2014](http://www.meetup.com/papers-we-love/events/178049922/)
Links: [Paper](https://www.cs.purdue.edu/homes/gkrichar/papers/onward2013-wuerthinger-truffle.pdf) | [Slides](http://www.slideshare.net/aysylu/pwl-one-vm-to-rule-them-all) | [Video](https://www.youtube.com/watch?v=kmQUB-5cEgM)
</span>

![aysylu greenberg](http://photos4.meetupstatic.com/photos/event/3/f/f/4/600_377356372.jpeg) The paper explains how you can write an interpreter and get an optimizing just-in-time (JIT) compiler for free. This enables language designers to focus on features without worrying about the complexities of compiler optimizations and code generation. This paper presents a Java Virtual Machine (JVM) that allows the application to control the JIT compiler behavior at runtime. We'll discuss how various programming languages can take advantage of this framework.

To intrigue compiler aficionados, the authors show how combining AST node rewriting during interpretation, optimization, and deoptimization produces high performance code from the interpreter without a language-specific compiler. In addition, they present how features of a variety of programming languages, such as JavaScript, Ruby, Python, R and others, map on the framework.

<p class="chapter-sponsor">
June Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### A Comparative Study of Convergent & Commutative Replicated Data Types
<span class="meta">
Speaker: [Chas Emerick](http://twitter.com/cemerick)
Date: [May 15, 2014](http://www.meetup.com/papers-we-love/events/175964662/)
Links: [Paper](http://hal.upmc.fr/docs/00/55/55/88/PDF/techreport.pdf) | [Slides](https://speakerdeck.com/cemerick/an-audiovisual-precis-of-a-comprehensive-study-of-convergent-and-commutative-replicated-data-types)
</span>

![peoples](http://photos3.meetupstatic.com/photos/event/5/7/0/600_364021392.jpeg) Conflict-free Replicated Data Types (CRDTs) are a formalism for providing practical data and programming primitives for use in distributed systems applications without necessitating expensive (and sometimes impractical) consensus mechanisms.  Their key characteristic is that they provide conflict-free "merging" of distributed concurrent updates given only the weak guarantees of eventual consistency.

<p class="chapter-sponsor">
May Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### Sparrow: Distributed, Low Latency Scheduling
<span class="meta">
Speaker: [David Greenberg](https://twitter.com/dgrnbrg)
Date: [April 15, 2014](http://www.meetup.com/papers-we-love/events/174731732/)
Links: [Paper](http://people.csail.mit.edu/matei/papers/2013/sosp_sparrow.pdf) | [Video](http://www.hakkalabs.co/articles/comp-sci-talks-data-engineers-distributed-low-latency-scheduling-sparrow)
</span>

![david greenberg](http://photos2.meetupstatic.com/photos/event/a/4/5/8/600_358182072.jpeg) When you need to execute code on a cluster of machines, deciding which machine should run that code becomes a complex problem, known as scheduling. We're all familiar with routing problems, such as the recent RapGenius incident. It turns out that simple improvements to randomized routing can dramatically improve the performance! Sparrow is a distributed scheduling algorithm for low latency, high throughput workloads. We'll review the Sparrow algorithm, and learn the tricks that they used. Then, we'll discuss other applications of Sparrow, besides the big-data map-reduce application it was created for.

<p class="chapter-sponsor">
April Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### Programming with Algebraic Effects and Handlers
<span class="meta">
Speaker: [Brandon Bloom](http://www.brandonbloom.name/)
Date: [March 15, 2014](http://www.meetup.com/papers-we-love/events/168722902/)
Links: [Paper](https://github.com/papers-we-love/papers-we-love/blob/master/plt/programming-with-algebraic-effects-and-handlers.pdf?raw=true) | [Audio](http://www.mixcloud.com/paperswelove/bbloom_3_17_2014_programming_with_alegebraic_effectshandlers/) | [Notes](https://github.com/papers-we-love/papers-we-love/issues/9)
</span>

![brandon bloom](http://photos4.meetupstatic.com/photos/event/8/e/8/2/highres_343416482.jpeg) Some great papers embody insights, others package up those insights into digestible bites. "Programing with Algebraic Effects and Handlers" is the later sort of great paper. After two decades of fundamental research in to the nature of computation, a lot of mysterious ideas in computer science such as continuations and exception handling finally made sense to a number of mathematically inclined geniuses. Bauer and Pretnar's Eff programming language cuts right through the heart of the theory in a way that makes sense to anybody who has ever written a functional program. This paper uses the Eff language to explore a number of simple computational effects that were traditionally viewed as quite varied and complex.

<p class="chapter-sponsor">
March Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

### A Uniﬁed Theory of Garbage Collection
<span class="meta">
Speaker: [Michael Bernstein](http://michaelrbernste.in/)
Date: [February 15, 2014](http://www.meetup.com/papers-we-love/events/163406212/)
Links: [Paper](http://www.cs.virginia.edu/~cs415/reading/bacon-garbage.pdf) | [Video](http://www.youtube.com/watch?v=XtUtfARSIv8) | [Slides](https://speakerdeck.com/mrb/papers-we-love-a-unified-theory-of-garbage-collection)
</span>

![mrb](http://photos3.meetupstatic.com/photos/event/8/1/3/0/highres_337713072.jpeg) Mike Bernstein is obsessed. Not with anything in particular, just in general. He's a Brooklyn, NYC based software developer and amateur Computer Scientist who writes at [http://michaelrbernste.in](http://michaelrbernste.in) and tweets (too much) at @mrb_bk. He's given talks on Garbage Collection and Distributed Systems in the past and is very excited to hang and chat with fellow NYC obsessives.

This our inaugural Meetup, and we're excited to have Michael Bernstein presenting the paper A Uniﬁed Theory of Garbage Collection by David F. Bacon, Perry Cheng, and V.T. Rajan.

<p class="chapter-sponsor">
February Sponsor
<a href="http://beatport.com/" class="sponsor"><img class="sponsor" src="/images/beatport_logo.png" title="Beatport" /></a>
</p>

</section>
<section class="secondary">
<h2>Chapter details</h2>
<p>
<strong>Location:</strong>
<a href="http://maps.google.com/maps?f=q&hl=en&q=40.739433,-73.989240">Viggle</a> - 902 Broadway, 11th floor
</p>
<p>
<strong>Sign-up:</strong>
Please RSVP for meetings via <a href="http://www.meetup.com/papers-we-love/">Meetup.com</a>
</p>
<p>
<strong>Twitter:</strong>
<a href="https://twitter.com/paperswelovenyc">@paperswelovenyc</a>
</p>
<p>
<strong>Organizers:</strong>
<a href="https://twitter.com/bowmanb">Brian Bowman</a>, <a href="https://twitter.com/CuevasClemente">Clemente Cuevas</a>, <a href="https://twitter.com/jeremyheiler">Jeremy Heiler</a>, <a href="https://twitter.com/zeeshanlakhani">Zeeshan Lakhani</a>, <a href="https://twitter.com/clint_newsom">Clint Newsom</a> and <a href="https://twitter.com/d_run">Darren Newton</a>
</p>
<h2>Sponsors</h2>
<p class="sponsor">
<a href="http://viggleinc.com"><img src="http://gadgetnerdly.com/wp-content/uploads/2012/06/logo_viggle.png" /></a>
Venue sponsor
</p>
<p class="sponsor"><a href="http://kisspatent.com/" class="sponsor"><img class="sponsor" src="/images/KISSPatent_Logo-fitted.png" title="KISSPatent" /></a>Food/Refreshments sponsor</p>

</section>
</article>
