.DEFAULT_GOAL := help
PWD ?= $(PWD)

MODULE_NAME = $(shell grep "module_name\":" setup.json | head -n1 | cut -d ':' -f2 | sed 's/[" ,]//g')
VERSION_FN = ${MODULE_NAME}/version.py

help:
	@echo "Personal container."
	@echo ""
	@echo "Targets:"
	@echo "  help          Print this help message"
	@echo "  build         Build the package"
	@echo "  pypi          Upload the the main PyPi server"
	@echo "  pypi_test     Upload the the test PyPi server"
	@echo "  bump_version  Bump the module version"

.PHONY: clean
clean:
	rm -rf build/* dist/* *egg-info*
	find . -name __pycache__ | xargs rm -rf

.PHONY: build
build: clean
	python setup.py sdist bdist_wheel

.PHONY: bump_version
bump_version:
	bin/bump_version ${VERSION_FN} --minor

.PHONY: bump_version_major
bump_version_minor: bump_version

.PHONY: bump_version_major
bump_version_major:
	bin/bump_version ${VERSION_FN} --major

.PHONY: pypi_test
pypi_test: build
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

.PHONY: pypi
pypi: build
	twine upload --verbose dist/*

.PHONY: test
test:
	PYTHONPATH=${PYTHONPATH}:${PWD} py.test -v --pdb
