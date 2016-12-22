+++
author = "bart"
comments = true
date = "2016-12-16T14:54:24+03:00"
draft = false
image = "images/2016/Dec/mathjax.png"
share = true
slug = "hello-mathjax-and-highligh"
tags = ["code", "math"]
title = "Hello Mathjax and Highlight.js"

+++
<div>$$\frac{1}{\sqrt{x}}$$</div>

Wait lets see what some syntax highlighting looks like! And a bit of extra stuff in here

```html
<section id="main">
  <div>
    <h1 id="title">{{ .Title }}</h1>
    {{ range .Data.Pages }}
      {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
```

```makefile
# Makefile

BUILDDIR      = _build
EXTRAS       ?= $(BUILDDIR)/extras

.PHONY: main clean

main:
	@echo "Building main facility..."
	build_main $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR)/*
```

And that is that!
