.PHONY: docs release clean build

clean:
	rm -rf venv

build:
	python3.6 -m venv venv && source venv/bin/activate && \
	pip install -r requirements.txt

test: clean build
	source venv/bin/activate && \
	coverage run --source=carnet setup.py test && \
	coverage html && \
	coverage report

docs:
	sphinx-build -aE docs build/docs > /dev/null

release: test docs
	open docs/generated/index.html
	open htmlcov/index.html
	vim carnet/__init__.py
