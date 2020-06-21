# Changelog

## [1.0.2] - 2020-06-21

### Changed
- Allow backups to include table and id sequence
- Allow development containers to specify Postgres version and extension version

## [1.0.1] - 2018-07-18

Important fixes

### Added
- Testing files run via Travis
- Uninstall files
- Necessary migration files

### Changed
- Use prefixed runtime settings (PostgreSQL only allows custom settings in this way)
- Additional README clarifications by @oetiker
- Allow `audit.log` data to be `pg_dump`'ed

## [1.0.0] - 2017-09-12

Initial fork

### Added
- JSONB minus operators to determine diffs
- Documentation
- Converted to PGXN-compatble extension

### Changed
- Use JSON instead of HSTORE
- Renamed `event_id` to `id`
- Added columns `application_name` and `application_user` that are populated
  via configurable runtime settings.

[1.0.2]: https://github.com/m-martinez/pg-audit-json/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/m-martinez/pg-audit-json/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/m-martinez/pg-audit-json/compare/05137fa...1.0.0
