test-requirements:
	pip install black mypy pylint pyyaml types-PyYAML

test: test-lint test-unit test-types test-format ## Run all tests by decreasing order of priority

test-format: ## Run code formatting tests
	black --check --diff tests.py

test-lint: ## Run code linting tests
	pylint --errors-only --enable=unused-import,unused-argument --ignore=templates tests.py

test-unit: ## Run unit tests
	python -m unittest run ./tests.py

test-types: ## Check type definitions
	mypy --ignore-missing-imports --implicit-reexport --strict tests.py
