all: build

build:
	latexmk -xelatex -synctex=1 -jobname=master-thesis main.tex

clean:
	rm *.aux \
	*.fdb_latexmk \
	*.fls \
	*.lof \
	*.lot \
	*.log \
	*.out \
	*.synctex.gz \
	*.toc

docker:
	docker build -t docker-latex .
	docker run --rm -ti -v ${PWD}:/master-thesis:Z docker-latex bash -c "make build && make clean"
	docker run --rm -ti -v ${PWD}:/master-thesis:Z docker-latex bash -c "make -C presentation && make -C presentation clean"
