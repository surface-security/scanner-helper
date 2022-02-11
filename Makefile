build:
	./build.sh

tests:
	tests/test_list.sh
	tests/test_logs.sh
	tests/test_clean.sh

.PHONY: build tests