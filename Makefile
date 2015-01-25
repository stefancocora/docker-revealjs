.PHONY: build slides shell

build:
	@docker build --rm -t fschl/revealjs:onbuild .

slides:
	@cd presi; docker build --rm -t fschl/revealjs:presi .
	@docker run -it --rm \
		-p 8000:8000 \
		fschl/revealjs:presi

dev:
	@cd presentation; docker build --rm -t fschl/revealjs:presentation .
	echo $(shell pwd)
	@docker run -it --rm \
		-p 8000:8000 \
		-v "$(shell pwd)"/presentation:/revealjs/md \
		-v "$(shell pwd)"/presentation/images:/revealjs/images \
		fschl/revealjs:presentation

shell:
	@docker run -it --rm \
		-p 8000:8000 \
		fschl/revealjs \
		/bin/bash
