DROP TABLE IF EXISTS food;
CREATE TABLE food (
  id INTEGER PRIMARY KEY,
  foodtype VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  calories INTEGER NOT NULL
);

--USE SINGLE QUOTES INSTEAD OF DOUBLE!

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (1, 'vegetable', 'carrot', 25);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (2, 'vegetable', 'beet', 59);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (3, 'vegetable', 'cucumber', 8);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (4, 'fruit', 'apple', 95);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (5, 'fruit', 'banana', 105);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (6, 'fruit', 'strawberry', 4);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (7, 'grain', 'bread', 100);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (8, 'grain', 'oatmeal', 160);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (9, 'processed', 'burger', 500);

INSERT INTO
  food (id, foodtype, name, calories)
VALUES
  (10, 'processed', 'fries', 400);
