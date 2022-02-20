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
