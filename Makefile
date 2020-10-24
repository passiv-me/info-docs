# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

.PHONY: help Makefile

docs: ./.venv/bin/activate
	$(MAKE) html
	cp -a ./build/html/. ./docs

venv: ./.venv/bin/activate
./.venv/bin/activate: requirements.txt
	@virtualenv .venv
	@. .venv/bin/activate
	@pip install --upgrade pip
	@pip install -r requirements.txt

html: ./.venv/bin/activate
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@echo "Cleaning project files..."
	@rm -rf build
	@rm -rf .venv
	@echo "Done."

# Put it first so that "make" without argument is like "make help".
help: ./.venv/bin/activate
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

Makefile: ;