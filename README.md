A simple, customizable table audit system for PostgreSQL implemented using
triggers and JSONB for storing diffs.

This trigger is a fork of [2ndQuadrant's audit trigger][1] implementation.

For more information:
  * https://github.com/2ndQuadrant/audit-trigger
  * http://wiki.postgresql.org/wiki/Audit_trigger_91plus

[1]: https://github.com/2ndQuadrant/audit-trigger


# Installation

Requirements:
  * PostgreSQL Server 9.5+ (including developer header files)

To install:

```
> git clone git@github.com:m-martinez/pg-audit-json
> cd pg-audit-json
> make
> make install
```

It is highly recommended that you only install this extension using a
postgres administrative account and not the account an application will
be using to interact the database.

In your postgres shell, activate the extension using:

```sql
> CREATE EXTENSION "pg-audit-json";
```

To  run the tests:

```
> make installcheck
```


# Contributing

This project provides and [editorconfig](http://editorconfig.org) to conform
to a coding style.

More information about PostgreSQL extensions
  * https://www.postgresql.org/docs/current/static/extend-pgxs.html
  * https://www.postgresql.org/docs/current/static/extend-extensions.html
  * http://manager.pgxn.org/howto

## Releasing

Remember to update the version tags in the following files:
  * META.json
  * pg-audit-json.control

