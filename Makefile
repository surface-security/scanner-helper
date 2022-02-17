all: test

build:
	docker build -t tmp-$(notdir $(CURDIR)) .

test: build
	tests/test_clean.sh tmp-$(notdir $(CURDIR))
	tests/test_list.sh tmp-$(notdir $(CURDIR))
	tests/test_logs.sh tmp-$(notdir $(CURDIR))
