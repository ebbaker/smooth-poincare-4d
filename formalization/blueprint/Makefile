.PHONY: all pdf web

all: pdf web

pdf:
	cd src && latexmk -pdf -outdir=../print -interaction=nonstopmode -halt-on-error print.tex

web:
	cd .. && lake build
	cd src && ../../.venv/bin/plastex -c plastex.cfg web.tex
