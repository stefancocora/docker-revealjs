.PHONY: build shell

build:
	@docker build --rm -t fschl/revealjs:onbuild .

shell:
	@docker run -it --rm \
		-p 8000:8000 \
		fschl/revealjs:onbuild \
		/bin/bash
