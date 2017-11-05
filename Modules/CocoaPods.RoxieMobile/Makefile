# Run make in each subdirectory
# @link https://stackoverflow.com/a/17845120

TOPTARGETS := default archive clean test build validate zip

ROOTDIR := Makefiles
SUBMAKE := $(wildcard $(ROOTDIR)/*.mk)

$(TOPTARGETS): $(SUBMAKE)
$(SUBMAKE):
	$(MAKE) -f $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(SUBMAKE)
