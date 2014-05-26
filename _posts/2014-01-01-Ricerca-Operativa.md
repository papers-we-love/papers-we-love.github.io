---
layout: post
title: "Ricerca Operativa"
date: 2014-03-19 17:40:41
category: University
---

Sito del corso : [link](http://www.or.deis.unibo.it/staff_pages/martello/Ricerca%20Operativa%20M_NEW/Page_LM_NEW.html)

Appunti
-------

<!-- Ciclo su tutti i file *.tex -->
<ul class="posts">
{% directory path: assets/RicercaOperativaM exclude: ^((?!tex).)*$ %}
	<li><span>&gt; </span><a href="{{ file.url_no_ext }}.pdf" >{{ file.name_no_ext }}.pdf</a> - <a href="{{ file.url }}">TeX file</a></li>
{% enddirectory %}
</ul>

Appunti originali di [Fabio Viola](https://github.com/desmovalvo/appunti-unibo) - Rivisti e corretti da Andrea Giardini
