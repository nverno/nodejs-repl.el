EMACS  ?= $(shell which emacs)
TARGET  = nodejs-repl
export EMACS

all: compile

compile: $(TARGET).elc

clean:
	@cask clean-elc

.cask:
	cask install

test: .cask compile
	cask exec $(EMACS) -Q --batch -L . -l test/test.el -f ert-run-tests-batch-and-exit
	$(MAKE) clean

.el.elc:
	@cask build

.PHONY: clean test
