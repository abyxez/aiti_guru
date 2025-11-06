setup:
	python3 -m venv .venv
	. .venv/bin/activate && pip install -r requirements.txt
schema:
	python3 db/schemas.py
	python3 main.py

all: setup schema
