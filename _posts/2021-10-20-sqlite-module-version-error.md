---
layout: post
title:  "How to solve the node version mismatch issue with an environment composed of electron, sqlite and jest"
author: "Lukasz Kokot"
tags: 
  - javascript
  - sqlite
  - electron
  - jest
---
You added `sqlite`, `better-sqlite3` or/and its helper `better-sqlite3-helper`
to your electron app, and you can now nicely bundle a database into your app.
Everything looks good... Except when you write integration tests for your SQL
queries and you end up with a strange `NODE_MODULE_VERSION` error.

<!--more-->
Developing an electron app can be tricky as it comes with its own set of tools
and command line utilities. Each electron version is built using a given Node
version, and more interestingly when you are building your own app, it's with
electron's Node version.
There is usually no harm in that...Except for native libraries included in
your dependencies (like `better-sqlite3`) that are compiled with `gyp` with
electron's Node. So, you can be in a situation where your native libraries were
compiled with Node 12, but you're using Node 14 to run the integration tests
with jest... Which leads to the following kind of error:

```text
NODE_MODULE_VERSION 82. This version of Node.js requires
NODE_MODULE_VERSION 72. Please try re-compiling or re-installing
the module (for instance, using `npm rebuild` or `npm install`).
```

(Interestingly, [here](https://nodejs.org/en/download/releases/) is the release
page for Node and the `NODE_MODULE_VERSION` for each release.)

In my own case, I was faced with a `NODE_MODULE_VERSION` with a number that
isn't even an official Node release (I don't know how it happened, but version
85 is nowhere to be found in theory)

There is a very well [explained solution](
https://github.com/JoshuaWise/better-sqlite3/issues/545#issuecomment-824887942)
that uses electron's node to run jest and would not lead to libraries being
rebuilt, but it did not work for me as expected - unfortunately.

Instead, I did what was suggested:

```sh
npm rebuild
```

It rebuilds the native libraries using the version of Node you are currently
using.
Unfortunately, it will most likely break the electron build which you will have
to rebuild again after you're done with the integration tests...
That's life 🤷‍♂️
