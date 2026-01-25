---
title: "Jessie Frazelle on SCONE: Secure Linux Containers with Intel SGX"
date: 2017-11-06
author: Andrew Gross
category: video
tags: meetup, video
label: Video
description: "Jessie Frazelle on SCONE: Secure Linux Containers with Intel SGX"
ogp:
  og:
    description: "Jessie Frazelle on SCONE: Secure Linux Containers with Intel SGX"
  fb:
    description: "Jessie Frazelle on SCONE: Secure Linux Containers with Intel SGX"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/3UYczEYrxuY" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - October 9, 2017

****

* **Meetup:** [https://www.meetup.com/papers-we-love/events/242066112/](https://www.meetup.com/papers-we-love/events/242066112/)
* **Paper:** [SCONE: Secure Linux Containers with Intel SGX](https://www.usenix.org/system/files/conference/osdi16/osdi16-arnautov.pdf)
* **Slides:** [Jessie Frazelle on SCONE: Secure Linux Containers with Intel SGX](https://speakerdeck.com/paperswelove/jessie-frazelle-on-scone-secure-linux-containers-with-intel-sgx#)
* **Audio:** [Jessie Frazelle on SCONE: Secure Linux Containers with Intel SGX](https://www.mixcloud.com/paperswelove/papers-we-love-10092017-jessie-frazelle-scone-secure-linux-containers/)

**Description**

Containers are the latest infrastructure trend. In 2016, the [SCONE paper](https://www.usenix.org/system/files/conference/osdi16/osdi16-arnautov.pdf) was written and presented at the [USENIX Symposium on Operating Systems Design and Implementation](https://www.usenix.org/conference/osdi16). It outlined how to use [Intel Secure Enclaves](https://en.wikipedia.org/wiki/Software_Guard_Extensions) to guard containers against attack. Containers are built on the kernel primitives cgroups and namespaces with additional LSM (Linux Security Module) layers on top, such as AppArmor, SELinux, and seccomp. Intel SGX protects code from modification by using protected areas of memory known as enclaves. With containers and adoption of cloud on the rise, this paper continues to be on the cutting edge of what is to come. Some cloud providers are now starting to expose hardware specific features like GPU and SGX, which would make running containers with Intel's SGX trusted execution a reality in the cloud. With Intel's SGX, you can have a container's process shielded from access by other programs. We'll explore how realistic this is today and in the future as well as what benefits this would have to the security of containers.


**Bio**

[Jessie Frazelle](https://blog.jessfraz.com/) works with Linux and Containers at Microsoft. She loves all things involving Linux namespaces and cgroups and is probably most well known for running desktop applications in containers. Jessie has been a maintainer of Docker and a contributor to RunC, Kubernetes, Linux, and Golang, among other projects, maintained the AppArmor, Seccomp, and SELinux bits in Docker, and is quite familiar with locking down containers.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&mini=1&feed=%2Fpaperswelove%2Fpapers-we-love-10092017-jessie-frazelle-scone-secure-linux-containers%2F" frameborder="0" ></iframe>

**Slides**

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="596" mozallowfullscreen="true" src="//speakerdeck.com/player/2960fbf0364f40e2a012c119c02ca239" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="https://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
