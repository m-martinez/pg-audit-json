CREATE EXTENSION "pg-audit-json";
-- Remove one key
SELECT '{"a": 1, "b": 2, "c": 3}'::jsonb - '{a}'::text[];
-- Remove multiple keys
SELECT '{"a": 1, "b": 2, "c": 3}'::jsonb - '{a,c}'::text[];
-- Return deletions from the original document
SELECT '{"a": 1, "b": 2, "c": 3}'::jsonb - '{"a": 1}'::jsonb;
-- Return changes from the original document
SELECT '{"a": 1, "b": 2, "c": 3}'::jsonb - '{"a": 1, "b": 99, "c": 3}'::jsonb;
-- Return changes from the original document (recursive)
SELECT '{"a":1, "b":{"c":123, "d":"test"}}'::jsonb
    - '{"a":1, "b":{"c":321, "d":"test"}}'::jsonb;
