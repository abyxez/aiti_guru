"""
Основной скрипт, который запускает проект.
В терминале выводятся результаты заданий 2.1 и 2.2.
Пример даталогической схемы schema.png будет расположен в корне проекта.
"""
import sqlite3
from pathlib import Path

DB_PATH = Path("test.db")
SCHEMA = Path("db/schema.sql")
SEED = Path("db/seed.sql")
QUERIES = Path("db/queries.sql")


def run_sql_file(cursor, path: Path):
    with open(path, "r", encoding="utf-8") as f:
        cursor.executescript(f.read())


def main():
    if DB_PATH.exists():
        DB_PATH.unlink()

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    run_sql_file(cursor, SCHEMA)
    run_sql_file(cursor, SEED)
    conn.commit()

    with open(QUERIES, "r", encoding="utf-8") as f:
        queries = [q.strip() for q in f.read().split(";") if q.strip()]

    for i, query in enumerate(queries, start=1):
        for row in cursor.execute(query):
            print(row)
        print()

    conn.close()


if __name__ == "__main__":
    main()
