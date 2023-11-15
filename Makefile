.PHONY: clean build view

PAPER_NAME=review_template
UNAME= $(shell uname)

LATEXMK_OPTS=-recorder -pdf -bibtex -pdflatex="pdflatex -synctex=1 --shell-escape %O %S"

ifeq ($(UNAME), Linux)
OPEN=xdg-open
endif
ifeq ($(UNAME), Darwin)
OPEN=open
endif

build: $(PAPER_NAME).pdf

clean:
	latexmk $(LATEXMK_OPTS) -C $(PAPER_NAME)

view: build
	$(OPEN) $(PAPER_NAME).pdf

$(PAPER_NAME).pdf: $(PAPER_NAME).tex
	latexmk $(LATEXMK_OPTS) $(PAPER_NAME)
