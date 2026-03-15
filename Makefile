.PHONY: install test lint run

install:
	python -m pip install --upgrade pip
	pip install -r requirements.txt

lint:
	ruff check .

test:
	pytest -q

run:
	python app/main.py
