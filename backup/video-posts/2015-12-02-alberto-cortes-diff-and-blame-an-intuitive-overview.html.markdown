---
title: "Alberto Cortés on Diff and Blame: an intuitive overview"
date: 2015-12-02
author: Joshua
category: video
tags: meetup, video
label: Video
description: "Diff and Blame: an intuitive overview by Alberto Cortes on 2015-12-02"
ogp:
og:
description: "Diff and Blame: an intuitive overview by Alberto Cortes on 2015-12-02"
fb:
description: "Diff and Blame: an intuitive overview by Alberto Cortes on 2015-12-02"
---

<iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/P18BYZvnSx8" frameborder="0" allowfullscreen></iframe>

READMORE

## Madrid - December  2, 2015

**Alberto Cortés** on Diff and Blame: an intuitive overview

* **Meetup:** [http://www.meetup.com/Papers-We-Love-Madrid/events/226986420/](http://www.meetup.com/Papers-We-Love-Madrid/events/226986420/)
* **Paper:** [An O(ND) Difference Algorithm and Its Variations](http://www.xmailserver.org/diff2.pdf)
* **Paper:** [Mining Version Archives for Co-changed Lines](https://users.soe.ucsc.edu/~ejw/papers/MSR26s-zimmermann.pdf)
* **Slides:** [https://drive.google.com/a/v25media.com/file/d/0B05KyBUlYY2TYWlZQVJUaGlwQ2s/view](https://drive.google.com/a/v25media.com/file/d/0B05KyBUlYY2TYWlZQVJUaGlwQ2s/view)

**Description**

En esta ocasión tenemos la suerte de contar con Alberto Cortés, que nos hablará de sus experiencias sobre Diff/Blame y cómo están construyendo su propia versión en Go

Diff es una algoritmo venerable, desarrollado en 1970 para Unix; básicamente es una distancia de Levenshtein, pero orientado a líneas en vez de a carácter. Git-blame utiliza diff de una forma bastante interesante para detectar qué commit fue el último en modificar cada línea de un fichero.

Durante la charla se revisarán como funcionan ambos algoritmos, diff y blame, de una forma intuitiva y Alberto nos hablará de los papers y recursos que ha utilizado para llevar a cabo su desarrollo.

---

<img class="left no-shadow" alt="ShuttleCloud" style="width: 120px" src="https://s3.amazonaws.com/image.infoarmy/1381336805080.png" /><br />
The **Madrid Chapter** would like to give special thanks to [ShuttleCloud](https://www.shuttlecloud.com/) for providing the venue for this meetup.
