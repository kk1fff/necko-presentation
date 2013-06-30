all: out/present.pdf

out/present.pdf: out/ns-io-service.pdf present.tex
	mkdir -p out
	cd out; \
	cp ../present.tex ./; \
	pdflatex present.tex

out/ns-io-service.pdf: ns-io-service.dot
	mkdir -p out
	cd out; \
	cp ../ns-io-service.dot ./; \
	dot -Tpdf ns-io-service.dot -o ns-io-service.pdf

clean:
	rm -rf out
