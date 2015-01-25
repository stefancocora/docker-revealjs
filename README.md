# Reveal.js inside a Docker container

Using [Reaveal.js](http://lab.hakim.se/reveal-js/ ) on [Github](https://github.com/hakimel/reveal.js ) 
using Version **3.0.0**


forked from *Peter Parente*s [dockerfiles](https://github.com/parente/dockerfiles/tree/master/revealjs ) 

## Usage

### Building The Base Image 

run `sudo make build` to build the basing image with `onbuild`-Property

### Creating A Presentation

1. edit file `test/slides.md`
2. put images inside `test/images` directory
3. run `sudo make dev`
4. visit `http://localhost:8000`
5. for speakernotes press `S`
5. ...
6. **PROFIT**

### Running A Presentation

1. run `sudo make slides`
2. for speakernotes press `S`
3. ...
4. **PROFIT**

## Creating Slides

- use a markdown `h2 title` for the slides title
- write normal text for, yea... text
- use `---` in a single line to seperate slides
- use `-` in a single line to seperate vertical slides
- start line with `Note:` for speakernotes
- **TODO:** add notes for *fragments, etc.*

## Credits To

reveal.js containerized. See http://mindtrove.info/a-reveal.js-docker-base-image-with-onbuild/ for details.
