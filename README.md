# Reveal.js in Docker

This image provides a **Reveal.js** ([Homepage](http://lab.hakim.se/reveal-js/ ) | [Github](https://github.com/hakimel/reveal.js )) presentation webserver inside a docker container.
It uses Version **3.0.0**

The Dockerfile is heavily based on work from *Peter Parente* [dockerfiles](https://github.com/parente/dockerfiles/tree/master/revealjs ) 

## Usage

Also available via docker hub. Simply `docker pull fschl/revealjs`.

### Creating A Presentation

*fschl/revealjs* comes with `onbuild` support. To create a new presentation use a 1-line-Dockerfile with

```bash
FROM fschl/revealjs:onbuild
```

 provide your slides in a file called **slides.md**. Then start a new container using

```bash
docker build -t $(USER)/revealjs:slides . && docker run -it --rm -p 8000:8000 $(USER)/revealjs:slides
```

An [Example Presentation Project](https://github.com/fschl/docker-revealjs-example ) is available. It comes with a handy Makefile.

1. edit the markdown file `slides.md`
2. put images inside `/images` directory
3. set specific styles in `custom.css`
4. run `make dev`
5. visit `http://localhost:8000`

Using the **dev** goal enables you to update the slides content, images and custom.css styles without needing to rebuilding the image or restarting the container!

### Running A Presentation

1. run `sudo make slides`
2. for speakernotes press `S`
3. **present**

## Credits To

reveal.js containerized. See http://mindtrove.info/a-reveal.js-docker-base-image-with-onbuild/ for details.
