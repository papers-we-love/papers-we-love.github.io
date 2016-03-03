---
title: "Bryan Cantrill on Jails and Solaris Zones"
date: 2016-03-03
author: Joshua
category: video
tags: meetup, video
label: Video
description: "Jails and Solaris Zones by Bryan Cantrill on 2016-03-03"
ogp:
og:
description: "Jails and Solaris Zones by Bryan Cantrill on 2016-03-03"
fb:
description: "Jails and Solaris Zones by Bryan Cantrill on 2016-03-03"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/hgN8pCMLI2U" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - February 11, 2016

**Bryan Cantrill** on [Jails](https://us-east.manta.joyent.com/bcantrill/public/ppwl-cantrill-jails.pdf) and [Solaris Zones](https://us-east.manta.joyent.com/bcantrill/public/ppwl-cantrill-zones.pdf)

* **Meetup:** [http://www.meetup.com/papers-we-love/events/228110831/](http://www.meetup.com/papers-we-love/events/228110831/)
* **Papers:** [Jails](https://us-east.manta.joyent.com/bcantrill/public/ppwl-cantrill-jails.pdf) & [Solaris Zones](https://us-east.manta.joyent.com/bcantrill/public/ppwl-cantrill-zones.pdf)
* **Slides:** [https://speakerdeck.com/paperswelove/bryan-cantrill-on-jails-and-solaris-zones](https://speakerdeck.com/paperswelove/bryan-cantrill-on-jails-and-solaris-zones)
* **Audio:** [https://www.mixcloud.com/paperswelove/bryan-cantrill-on-jails-solaris-zones/](https://www.mixcloud.com/paperswelove/bryan-cantrill-on-jails-solaris-zones/)

**Description**

Description
------------------

### Jails: Confining the omnipotent root.

The traditional UNIX security model is simple but inexpressive. Adding fine-grained access control improves the expressiveness, but often dramatically increases both the cost of system management and implementation complexity. In environments with a more complex management model, with delegation of some management functions to parties under varying degrees of trust, the base UNIX model and most natural extensions are inappropriate at best. Where multiple mutually untrusting parties are introduced, "inappropriate" rapidly transitions to"nightmarish", especially with regards to data integrity and privacy protection. The FreeBSD "Jail" facility provides the ability to partition the operating system environment, while maintaining the simplicity of the UNIX "root" model. In Jail, users with privilege find that the scope of their requests is limited to the jail, allowing system administrators to delegate management capabilities for each virtual machine environment. Creating virtual machines in this manner has many potential uses; the most popular thus far has been for providing virtual machine services in Internet Service Provider environments.

### Solaris Zones: Operating System Support for Consolidating Commercial Workloads

Server consolidation, which allows multiple workloads to run on the same system, has become increasingly important as a way to improve the utilization of computing resources and reduce costs. Consolidation is common in mainframe environments, where technology to support running multiple workloads and even multiple operating systems on the same hardware has been evolving since the late 1960’s. This technology is now becoming an important differentiator in the UNIX and Linux server market as well, both at the low end (virtual web hosting) and high end(traditional data center server consolidation).This paper introduces Solaris Zones (zones), a fully realized solution for server consolidation projects in a commercial UNIX operating system. By creating virtualized application execution environments within a single instance of the operating system, the facility strikes a unique balance between competing requirements. On the one hand, a system with multiple workloads needs to run those workloads in isolation, to ensure that applications can neither observe data from other applications nor affect their operation. It must also prevent applications from over-consuming system resources. On the other hand, the system as a whole has to be flexible, manageable, and observable, in order to reduce administrative costs and increase efficiency. By focusing on the support of multiple application environments rather than multiple operating system instances, zones meets isolation requirements without sacrificing manageability.

**Bio**

Bryan Cantrill ([@bcantrill](@bcantrill)) is the CTO at Joyent, where he oversees worldwide development of the SmartOS and SmartDataCenter platforms, and the Node.js platform. Prior to joining Joyent, Bryan served as a Distinguished Engineer at Sun Microsystems, where he spent over a decade working on system software, from the guts of the kernel to client-code on the browser. In particular, he co-designed and implemented DTrace, a facility for dynamic instrumentation of production systems that won the Wall Street Journal's top Technology Innovation Award in 2006 and the USENIX Software Tools User Group Award in 2008. Bryan also co-founded the Fishworks group at Sun, where he designed and implemented the DTrace-based analytics facility for the Sun Storage 7000 series of appliances.

Bryan received the ScB magna cum laude with honors in Computer Science from Brown University.

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="http://www.twosigma.com">TwoSigma</a> and <a href="http://enigma.io/">Enigma</a> for helping to make this meetup possible.</span>
</p>
---
