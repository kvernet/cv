COMPILER= xelatex

.PHONY: en fr

en: cv-en.pdf

fr: cv-fr.pdf

define build_paper
	mkdir -p build-$1
	cp -r $^ build-$1
	cd build-$1 && \
	$(COMPILER) cv-$1.tex && \
	mv cv-$1.pdf ..
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
	rm -rf build-en cv-en.pdf build-fr cv-fr.pdf
