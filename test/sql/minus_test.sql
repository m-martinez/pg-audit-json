CREATE EXTENSION "pg-audit-json";

-- Remove one key
SELECT '{"a": 1, "b": 2, "c": 3}'::jsonb - '{a}'::text[];

-- Remove multiple keys
SELECT '{"a": 1, "b": 2, "c": 3}'::jsonb - '{a,c}'::text[];

-- Test usage scenario where NEW - OLD

-- Removed c
SELECT '{"a": 1, "b": 2}'::jsonb
     - '{"a": 1, "b": 2, "c": 3}'::jsonb;

-- Changed b
SELECT '{"a": 1, "b": 99, "c": 3}'::jsonb
     - '{"a": 1, "b": 2, "c": 3}'::jsonb;

-- Added d
SELECT '{"a": 1, "b": 2, "c": 3, "d": 4}'::jsonb
     - '{"a": 1, "b": 2, "c": 3}'::jsonb;

-- Recursive changed b->c
SELECT '{"a":1, "b":{"c":321, "d":"test"}}'::jsonb
     - '{"a":1, "b":{"c":123, "d":"test"}}'::jsonb;

DROP EXTENSION "pg-audit-json";
