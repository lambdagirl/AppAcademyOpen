PRAGMA foreign_keys
= ON;

-- CREATE TABLES

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
)

DROP TABLE IF EXISTS questions;
CREATE TABLE questions
(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY
  (author_id) REFERENCES users
  (id),
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows
(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
)


DROP TABLE IF EXISTS replies;
CREATE TABLE replies
(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  -- Each reply should have a reference to its parent reply.
  -- "Top level" replies don't have any parent, but all replies have a subject question.
  parent_reply_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
)


DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes
(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
)


-- INSERT TABLES
INSERT INTO users
  (fname,lname)
VALUES
  ('PEIZHI', 'ZHENG'),
  ('ERIKA', 'HIBINO');


INSERT INTO questions
  (title,body, author_id)
SELECT
  'Easy Question', 'How old is Peizhi?', user.id
FROM
  users
WHERE 
user.fname = "PEIZHI" AND user.lname = "ZHENG";

INSERT INTO questions
  (title,body, author_id)
SELECT
  'HARD Question', 'How old is ERIKA?', user.id
FROM
  users
WHERE 
user.fname = "ERIKA" AND user.lname = "HIBINO";



  