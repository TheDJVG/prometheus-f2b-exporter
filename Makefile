NAME := $(notdir $(shell pwd))
SUB_VERSION := $(shell git describe --tags --always --dirty=-dev)
VERSION := $(shell grep -oP "^VERSION[ =]+'\K[\d.]+" $(NAME) )-$(SUB_VERSION)
DESCRIPTION := Fail2ban prometheus exporter.
URL := https://github.com/TheDJVG/prometheus-f2b-exporter
DEPENDENCIES := python3^(>=3.5) python3-prometheus-client^(>=0.5.0) fail2ban
MAINTAINER := $(shell git config user.name) <$(shell git config user.email)>
TEMPDIR=$(shell mktemp -d)

.PHONY: package
package:
	fpm -s dir -t deb \
		-n $(NAME) \
		-v $(VERSION) \
		$(foreach var,$(DEPENDENCIES),-d '$(subst ^, ,${var})') \
		--description '$(DESCRIPTION)' \
	    --url '$(URL)' \
		--vendor '$(MAINTAINER)' \
		--maintainer '$(MAINTAINER)' \
		--license MIT -a all \
		--prefix /usr/bin $(NAME)
