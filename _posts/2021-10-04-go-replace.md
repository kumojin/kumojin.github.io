---
layout: post
title:  "How to force Go to use a different version of a derived dependency"
author: "Lukasz Kokot"
tags: 
  - golang
  - mod
---
Suddenly, your CI pipeline starts failing because the dependency checker step
fails on a [CVE](https://cve.mitre.org/index.html) being detected in a
derived package used by one of your dependencies. Is there a way in Go to
change the version of the derived package ?

<!--more-->
Here's how a `go.mod` file usually looks like:

```text
module kumojin.com/my-module

go 1.15

require (
  github.com/thoas/go-funk v0.9.0
)
```

Now, let's imagine that `go-funk` depends on a `go-funk-dep` package. We would
basically have a `go.sum` file like that:

```text
github.com/thoas/go-funk v0.9.0 h1:Yzu8aTjTb1sqHZzSZLBt4qaZrFfjNizhA7IfnefjEzo=
github.com/thoas/go-funk v0.9.0/go.mod h1:+IWnUfUmFO1+WVYQWQtIJHeRRdaIyyYglZN7xzUPe4Q=
github.com/thoas/go-funk-dep v0.1.0/go.mod h1:sDjTOq0yUyv5G4h+BqSea7Fn6BU+XbolEz1952UB+mk=
```

If you wanted to force Go modules to use an updated version (or your forked,
fixed one), how would you do that?

Well, you could run the following command to update to a different version of
the package:

```sh
go mod edit -replace github.com/thoas/go-funk-dep@v0.1.0=github.com/thoas/go-funk-dep@v0.2.0
```

What it does is change the `go.mod` like that (and so you could also just
manually edit it yourself), and the `go.sum` accordingly:

```text
module kumojin.com/my-module

go 1.15

require (
  github.com/thoas/go-funk v0.9.0
)

replace github.com/thoas/go-funk-dep v0.1.0 => github.com/thoas/go-funk-dep v0.2.0
```
