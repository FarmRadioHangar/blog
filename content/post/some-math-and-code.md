+++
title = "Hello Mathjax and Highlight.js"
author = "bart"
date = "2016-12-16T14:54:24+03:00"
draft = false
slug = "hello-mathjax-and-highligh"
tags = ["code","math"]
image = "images/2016/Dec/mathjax.png"
comments = true     # set false to hide Disqus comments
share = true        # set false to share buttons
menu = ""           # set "main" to add this content to the main menu

+++
<div>$$\frac{1}{\sqrt{x}}$$</div>


Wait lets see what some syntax highlighting looks like!

~~~html
<section id="main">
  <div>
    <h1 id="title">{{ .Title }}</h1>
    {{ range .Data.Pages }}
      {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
~~~

~~~makefile
# Makefile

BUILDDIR      = _build
EXTRAS       ?= $(BUILDDIR)/extras

.PHONY: main clean

main:
	@echo "Building main facility..."
	build_main $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)/*
~~~

And that is that!
