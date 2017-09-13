CREATE EXTENSION "pg-audit-json";
SET client_min_messages TO WARNING;

CREATE TABLE foo (
  id BIGSERIAL PRIMARY KEY,
  a INTEGER,
  b INTEGER,
  c INTEGER
);

SELECT audit.audit_table('foo', true, true, '{id}'::text[]);

--
-- Basic INSERT/UPDATE/DELETE
--

--- insert
INSERT INTO foo (a, b, c) VALUES (1, 2, 3) RETURNING id AS record_id \gset
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

--- update
UPDATE foo SET b = 99 WHERE id = :record_id;
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

--- delete
DELETE FROM foo WHERE id = :record_id;
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

--
-- With table modifications
--

--- insert
INSERT INTO foo (a, b, c) VALUES (4, 5, 6) RETURNING id AS record_id \gset
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

--- add column to table and update record
ALTER TABLE foo ADD COLUMN d INTEGER;
UPDATE foo SET d = 7 WHERE id = :record_id;
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

--- remove column from table and update record
ALTER TABLE foo DROP COLUMN d;
UPDATE foo SET c = 99 WHERE id = :record_id;
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

--- delete
DELETE FROM foo WHERE id = :record_id;
SELECT row_data, changed_fields FROM audit.log ORDER BY id DESC LIMIT 1;

DROP TABLE foo;

DROP EXTENSION "pg-audit-json";
