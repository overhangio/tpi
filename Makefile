.DEFAULT_GOAL := help

test-requirements: ## Install test requirements
	pip install black mypy pylint pyyaml types-PyYAML

test: test-lint test-unit test-types test-format ## Run all tests by decreasing order of priority

test-format: ## Run code formatting tests
	black --check --diff *.py

test-lint: ## Run code linting tests
	pylint --errors-only --enable=unused-import,unused-argument --ignore=templates *.py

test-unit: ## Run unit tests
	python -m unittest run ./tests.py

test-types: ## Check type definitions
	mypy --ignore-missing-imports --implicit-reexport --strict *.py

format: ## Format code
	black *.py

ESCAPE = 
help: ## Print this help
	@grep -E '^([a-zA-Z_-]+:.*?## .*|######* .+)$$' Makefile \
		| sed 's/######* \(.*\)/@               $(ESCAPE)[1;31m\1$(ESCAPE)[0m/g' | tr '@' '\n' \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'
