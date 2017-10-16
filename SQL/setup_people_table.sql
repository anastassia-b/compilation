DROP TABLE IF EXISTS app_academy;
CREATE TABLE app_academy (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS hack_reactor;
CREATE TABLE hack_reactor (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS friendships;
CREATE TABLE friendships (
  aa_id INTEGER NOT NULL,
  hr_id INTEGER NOT NULL
);

INSERT INTO
  app_academy (id, name)
VALUES
  (1, 'Jesse');

INSERT INTO
  app_academy (id, name)
VALUES
  (2, 'AJ');

INSERT INTO
  app_academy (id, name)
VALUES
  (3, 'David');

INSERT INTO
  hack_reactor (id, name)
VALUES
  (1, 'Joe');

INSERT INTO
  hack_reactor (id, name)
VALUES
  (2, 'Jane');

INSERT INTO
  hack_reactor (id, name)
VALUES
  (3, 'John');

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (1, 1);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (1, 2);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (1, 3);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (2, 3);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (3, 1);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (3, 2);

INSERT INTO
  friendships (aa_id, hr_id)
VALUES
  (2, 2);
