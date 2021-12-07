TAG=tggreene/carbone-api
ESCAPED_TAG=$(subst /,\/,$(TAG))
API_VERSION=$(shell jq -r '.version' package.json)
CARBONE_VERSION=$(shell jq -r '.dependencies["@tggreene/carbone"]' package.json)
VERSION := $(CARBONE_VERSION)-$(API_VERSION)

.PHONY: audit release major-release update-readme 

audit:
	@echo "\$$(TAG) =" '$(TAG)'
	@echo "\$$(ESCAPED_TAG) =" '$(ESCAPED_TAG)'
	@echo "\$$(CARBONE_VERSION) =" '$(CARBONE_VERSION)'
	@echo "\$$(API_VERSION) =" '$(API_VERSION)'
	@echo "\$$(VERSION) =" '$(VERSION)'

update-readme:
	sed -i 's/$(ESCAPED_TAG).*/$(ESCAPED_TAG):$(VERSION)/' README.md
	git add README.md
	git commit -m 'Update readme version $(TAG):$(VERSION)'

docker-release:
	docker build -t $(TAG):$(VERSION) .
	docker push $(TAG):$(VERSION)

release:
	npm version minor
	$(MAKE) update-readme
	$(MAKE) docker-release
	git push --follow-tags origin master
