TAG=tggreene/carbone-api
ESCAPED_TAG=$(subst /,\/,$(TAG))
API_VERSION=$(shell jq -r '.version' package.json)
CARBONE_VERSION=$(shell jq -r '.dependencies["@tggreene/carbone"]' package.json)
VERSION := $(CARBONE_VERSION)-$(API_VERSION)

audit:
	@echo "\$$(TAG) =" '$(TAG)'
	@echo "\$$(ESCAPED_TAG) =" '$(ESCAPED_TAG)'
	@echo "\$$(CARBONE_VERSION) =" '$(CARBONE_VERSION)'
	@echo "\$$(API_VERSION) =" '$(API_VERSION)'
	@echo "\$$(VERSION) =" '$(VERSION)'

publish:
	docker build -t $(TAG):$(VERSION) .
	docker push $(TAG):$(VERSION)
	sed -i 's/$(ESCAPED_TAG).*/$(ESCAPED_TAG):$(VERSION)/' README.md
	git add README.md
	git commit -m 'Update image tag $(TAG):$(VERSION)'
	git tag $(VERSION)
	git push origin $(VERSION)
