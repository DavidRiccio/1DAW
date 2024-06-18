from __future__ import annotations
import sqlite3

DB_PATH = "todo.db"
TASK_DONE_SYMBOL = "✔"
TASK_PENDING_SYMBOL = "⎕"

class Task:
    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def __init__(self, name: str, done: bool = False, id: int = -1):
        self.name = name
        self.done = done
        self.id = id

    def save(self):
        """Guarda esta tarea en la base de datos.
        El identificador asignado en la base de datos se debe usar para actualizar el
        atributo id de la tarea."""

        sql = 'INSERT INTO tasks (name, done) VALUES (:name, :done)'
        Task.cur.execute(sql, dict(name=self.name, done=self.done))
        self.id = Task.cur.lastrowid
        Task.con.commit()

    def update(self):
        query = "UPDATE tasks SET name = ?, done = ? WHERE id = ?"
        Task.cur.execute(query, (self.name, int(self.done), self.id))
        Task.con.commit()

    def check(self):
        self.done = True
        self.update()

    def uncheck(self):
        self.done = False
        self.update()

    def __repr__(self):
        symbol = TASK_DONE_SYMBOL if self.done else TASK_PENDING_SYMBOL
        return f"{symbol} {self.name} (id={self.id})"
    

    @classmethod
    def from_db_row(cls, row: sqlite3.Row) -> Task:
        return cls(row["name"], bool(row["done"]), row["id"])

    @classmethod
    def get(cls, task_id: int) -> Task:
        query = "SELECT * FROM tasks WHERE id = ?"
        cls.cur.execute(query, (task_id,))
        row = cls.cur.fetchone()
        if row:
            return cls.from_db_row(row)
        else:
            raise ValueError(f"Task with id {task_id} does not exist")


class ToDo:
    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def create_db(self):
        query = """CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        name TEXT,
        done INTEGER
        )"""
        ToDo.cur.execute(query)
        ToDo.con.commit()

    def get_tasks(self, *, done: int = -1):
        if done == 0:
            query = "SELECT * FROM tasks WHERE done = ?"
            ToDo.cur.execute(query, (0,))
        elif done == 1:
            query = "SELECT * FROM tasks WHERE done = ?"
            ToDo.cur.execute(query, (1,))
        else:
            query = "SELECT * FROM tasks"
            ToDo.cur.execute(query)
        
        rows = ToDo.cur.fetchall()
        for row in rows:
            yield Task.from_db_row(row)

    def add_task(self, name: str):
        query = "INSERT INTO tasks (name, done) VALUES (?, ?)"
        ToDo.cur.execute(query, (name, 0))
        ToDo.con.commit()

    def complete_task(self, task_id: int):
        query = "UPDATE tasks SET done = ? WHERE id = ?"
        ToDo.cur.execute(query, (1, task_id))
        ToDo.con.commit()

    def reopen_task(self, task_id: int):
        query = "UPDATE tasks SET done = ? WHERE id = ?"
        ToDo.cur.execute(query, (0, task_id))
        ToDo.con.commit()
