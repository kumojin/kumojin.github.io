---
layout: post
title:  "How to make a performance testing on a socket.io server"
author: "Julien Maitrehenry"
tags: 
  - javascript
  - websocket 
  - socket.io
---
What you will learn? Use [Artillery](https://artillery.io) to make a
performance test on a socket.io v3+ server.
<!--more-->
Because a WebSocket server doesn't act like an HTTP server, it's harder to
create a test sequence. But, Artillery provides all the tooling we need!

## Install Artillery

Artillery is a Node.js application and can be installed with npm:

```sh
npm install -g artillery
```

Add the WebSocket v3+ engine:

```sh
npm install -g artillery-engine-socketio-v3
```

### Create your first scenario

```yml
config:
  target: "https://chat.example.com"
  engines:
    socketio-v3:
      transports: ['websocket']
  phases:
    - duration: 100
      arrivalRate: 5
      rampTo: 20
scenarios:
  - engine: socketio-v3
    flow:
      - emit: ["add user", "user"]
      - think: 10
      - emit: ["typing"]
      - think: 1
      - emit: ["new message", "hello"]
      - emit: ["stop typing"]
```

### Run your test

```sh
artillery run myscenario.yml
```

And that's all!

```text
All virtual users finished
Summary report @ 02:18:36(+0000) 2021-10-12
  Scenarios launched:  1304
  Scenarios completed: 1304
  Requests completed:  5216
  Mean response/sec: NaN
  Response time (msec):
    min: 0
    max: 2.4
    median: 0.1
    p95: 0.2
    p99: 0.3
  Scenario counts:
    0: 1304 (100%)
  Codes:
    0: 5216
  engine.socketio.emit: 5216
```
