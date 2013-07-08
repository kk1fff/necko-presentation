all: out/present.pdf

INCLUDED_GRAPHIC = \
	out/ns-io-service.pdf \
	out/sts-startup.pdf \
	out/ns-i-channel.pdf \
	out/ns-i-socket-transport.pdf \
	out/own-socket.pdf \
	out/patrick-protocol.png

out/present.pdf: ${INCLUDED_GRAPHIC} present.tex
	mkdir -p out
	cd out; \
	cp ../present.tex ./; \
	pdflatex present.tex

out/%.pdf: %.dot
	mkdir -p out
	cd out; \
	cp ../$< ./; \
	dot -Tpdf $< -o $(notdir $@)

# precompiled pdf
out/%.pdf: %.pdf
	mkdir -p out
	cd out; \
	cp ../$< ./

out/%.png: %.png
	mkdir -p out
	cp $< $@

clean:
	rm -rf out
