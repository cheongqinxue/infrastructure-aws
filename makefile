.PHONY: all test clean
all: test
test:
	./initial.sh
	terraform init
	tflint --init
	pre-commit run -a --show-diff-on-failure