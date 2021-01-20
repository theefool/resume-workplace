RESUME := $(CURDIR)/resume.md
THIRDPARTY_DIR := $(CURDIR)/3rdparty
VENV_DIR := $(THIRDPARTY_DIR)/make-virtualenv
RESUME_MD_DIR := $(THIRDPARTY_DIR)/resume.md
RESUME_MD_ENVVAR := MD=$(RESUME)
PDF := $(RESUME_MD_DIR)/resume.pdf

.PHONY: all env clean watch

all: $(PDF)

$(PDF): $(RESUME) env
	. $(VENV_DIR)/.env/bin/activate && \
	$(MAKE) $(RESUME_MD_ENVVAR) -C $(RESUME_MD_DIR) resume

env:
	$(MAKE) -C $(VENV_DIR)

watch:
	$(MAKE) $(RESUME_MD_ENVVAR) -C $(RESUME_MD_DIR) watch

clean:
	$(MAKE) $(RESUME_MD_ENVVAR) -C $(RESUME_MD_DIR) clean
	$(MAKE) -C $(VENV_DIR) clean
