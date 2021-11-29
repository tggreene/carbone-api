TAG=tggreene/carbone-api
ESCAPED_TAG=$(subst /,\/,$(TAG))
CARBONE_VERSION=3.4.1
API_VERSION=1
VERSION := $(CARBONE_VERSION)-$(API_VERSION)

publish:
	docker build -t $(TAG):$(VERSION) .
	docker push $(TAG):$(VERSION)
	sed -i 's/$(ESCAPED_TAG).*/$(ESCAPED_TAG):$(VERSION)/' README.md
	git add README.md
	git commit -m 'Update image tag $(TAG):$(VERSION)'
	git tag $(VERSION)
	git push origin $(VERSION)
