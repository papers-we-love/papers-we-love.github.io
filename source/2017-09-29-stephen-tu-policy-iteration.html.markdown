---
title: "Stephen Tu on Least Squares Policy Iteration"
date: 2017-09-29
author: Lydia Gu
category: video
tags: meetup, video
label: Video
description: "Stephen Tu on Least Squares Policy Iteration"
ogp:
  og:
    description: "Stephen Tu on Least Squares Policy Iteration"
  fb:
    description: "Stephen Tu on Least Squares Policy Iteration"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/WpHPMqzufJY" frameborder="0" allowfullscreen></iframe>

READMORE

## New York - August 31, 2017

****

* **Meetup:** [https://www.meetup.com/papers-we-love/events/242063907/](https://www.meetup.com/papers-we-love/events/242063907/)
* **Paper:** [Least Squares Policy Iteration](https://users.cs.duke.edu/~parr/jmlr03.pdf)
* **Slides:** [Stephen Tu on Least Squares Policy Iteration](https://speakerdeck.com/paperswelove/stephen-tu-on-least-squares-policy-iteration)
* **Audio:** [Stephen Tu on Least Squares Policy Iteration](https://www.mixcloud.com/paperswelove/stephen-tu-on-least-squares-policy-iteration/)

**Description**

Policy iteration is a classic dynamic programing algorithm for solving a Markov Decision Process (MDP). In policy iteration, the algorithm alternates between two steps: 1) a policy evaluation step which, given the current policy, computes the state-action value function (commonly known as the Q-function) for the policy, and 2) a policy improvement step, which uses the Q-function to greedily improve the current policy. When the number of states and actions of the MDP is finite and small, policy iteration performs well and comes with nice theoretical guarantees. However, when the state and action spaces are large (possibly continuous), policy iteration becomes intractable, and approximate methods for solving MDPs must be used. 

Least Squares Policy Iteration (LSPI) is one method for approximately solving an MDP. The key idea here is to approximate the Q-function as a linear functional in a lifted, higher dimensional space, analogous to the idea of feature maps in supervised learning. Plugging this approximation into the Bellman equation gives a tractable linear system of equations to solve for the policy evaluation step. Furthermore, the policy improvement step remains the same as before.

This talk describes LSPI and some of its subtleties. One subtlety arises due to the fact that the Bellman operator is not necessarily invariant on our approximate function class, and hence an extra projection step is typically used to minimize the Bellman residual after projecting back on the function space. Furthermore, in order to build intuition for LSPI, I will also talk about what the LSPI algorithm does in the context of a well studied continuous optimal control problem known as the Linear Quadratic Regulator (LQR).

**Bio**

[Stephen Tu](https://people.eecs.berkeley.edu/~stephentu/) is a PhD student in the EECS department at UC Berkeley, studying problems in the intersection of optimization, control theory, and statistics. This summer, he is interning at the Google Brain team in NYC, which has sparked his interest in reinforcement learning.

**Audio**

<iframe width="100%" height="60" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&mini=1&feed=%2Fpaperswelove%2Fstephen-tu-on-least-squares-policy-iteration%2F" frameborder="0" ></iframe>

**Slides**

<iframe class="video" allowfullscreen="true" allowtransparency="true" frameborder="0" height="596" mozallowfullscreen="true" src="//speakerdeck.com/player/d1ca498f1955406dac8ebb85ece952ad" style="border:0; padding:0; margin:0; background:transparent;" webkitallowfullscreen="true" width="710"></iframe>

---

<p style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
<a href="https://www.twosigma.com/"><img src="/images/TwoSigma_RGB.jpg" alt="TwoSigma" title="TwoSigma - Platinum Sponsor of Papers We Love NYC" style="width: 200px; margin: 0 1em 0 0;"></a> <span style="flex: 1;">The <strong>New York Chapter</strong> would like to thank <a href="https://www.twosigma.com">TwoSigma</a> for helping to make this meetup possible.</span>
</p>

---
