COMPILER= xelatex

.PHONY: en fr all

all: en fr

en: cv-en.pdf

fr: cv-fr.pdf

define build_paper
	mkdir -p build-$1
	cp -r $^ build-$1
	cd build-$1 && \
	$(COMPILER) cv-$1.tex && \
	mkdir -p ../pdf/$1 && \
	mv cv-$1.pdf ../pdf/$1/CV.pdf
endef

SRC_EN= docs/cv-en.tex \
        docs/settings.tex \
        docs/Fonts \
        docs/FreemanCV.cls        

cv-en.pdf: $(SRC_EN) $(FIGURES)
	$(call build_paper,en)


SRC_FR= docs/cv-fr.tex \
        docs/settings.tex \
        docs/Fonts \
        docs/FreemanCV.cls

cv-fr.pdf: $(SRC_FR) $(FIGURES)
	$(call build_paper,fr)

clean:
	rm -rf build-* pdf
