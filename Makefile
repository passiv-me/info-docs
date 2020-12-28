# Minimal makefile for Sphinx documentation

PYTHON_VERSION = 3.7.5
VENV_NAME = info_docs-$(PYTHON_VERSION)

# You can set these variables from the command line.
SPHINXOPTS =
SPHINXBUILD = sphinx-build
SOURCEDIR = source
BUILDDIR = build

.PHONY: help Makefile

docs: .python-version $(SOURCEDIR)/*
	$(MAKE) html
	cp -a ./build/html/. ./docs

venv: .python-version
.python-version: requirements.txt
	-pyenv uninstall -f $(VENV_NAME)
	@pyenv virtualenv $(PYTHON_VERSION) $(VENV_NAME)
	pyenv local $(VENV_NAME)
	@pip install --upgrade pip
	@pip install -r requirements.txt

html: .python-version
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@echo "Cleaning project files..."
	@rm -rf build
	@-pyenv uninstall -f $(VENV_NAME)
	@rm -rf .python-version
	@echo "Done."

# Put it first so that "make" without argument is like "make help".
help: .python-version
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

Makefile: ;