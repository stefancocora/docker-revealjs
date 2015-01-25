# Docker + reveal.js

### A reveal.js Docker Base Image with ONBUILD

go get it!

```bash
git clone https://github.com/fschl/docker-revealjs
```


Note: something to talk abooouuut

---

## Write your slides

in a simple markdown file

-

## vertical #1

with content

-

## a picture

![Docker](images/docker-small_h-dark.png ) 

---

## Write a one-line Dockerfile

```bash
FROM fschl/revealjs:onbuild
```

---

## Build it

```bash
$ docker build -t myslides .
```

---

## Run it

```bash
$ docker run -d -P myslides
```

---

## View it

See http://mindtrove.info/a-reveal.js-docker-base-image-with-onbuild
