# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Enterprise organization creation and management via `github_enterprise_organization` resource
- Comprehensive organization settings configuration via `github_organization_settings` resource
- Automatic enterprise ID lookup using `enterprise_slug` with `github_enterprise` data source
- Security-first defaults for GitHub Advanced Security features
  - Advanced Security enabled for new repositories
  - Secret scanning with push protection enabled
  - Dependabot alerts and security updates enabled
  - Dependency graph enabled for vulnerability tracking
- Granular member permission controls following least privilege principles
- Project settings management (organization and repository projects)
- Web commit signoff requirement option
- Comprehensive variable validation
- Basic and comprehensive usage examples
- Complete documentation with README, CONTRIBUTING, and TESTING guides
- Support for both direct `enterprise_id` and slug-based `enterprise_slug` configuration

### Security

- Security-first module defaults prioritize data protection
- Sensitive outputs marked with `sensitive = true`
- Least privilege default permissions for organization members
- Support for optional web commit signoff enforcement

## [0.0.0] - 2025-12-18

### Initial Release

- Project structure and skeleton implementation

---

## Versioning

### Version 1.0.0 Release Checklist

- [ ] All features tested and working
- [ ] Documentation complete and reviewed
- [ ] Examples validated with real GitHub Enterprise
- [ ] Security review completed
- [ ] Breaking changes (if any) clearly documented
- [ ] Changelog updated with all changes

### Breaking Changes Policy

Breaking changes will be documented clearly and typically trigger a major version bump (e.g., 1.0.0 → 2.0.0). Examples of breaking changes:

- Removal of variables or outputs
- Changes to default values that affect security
- Changes to resource naming that require state migration
- Changes to required provider versions

### Deprecation Policy

Deprecated features will:

1. Be marked clearly in code and documentation
2. Continue to work for at least one minor version
3. Show clear migration path in comments and documentation
4. Be fully removed in the next major version

---

## Release History Template

For future releases, use this template:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added

- New feature descriptions

### Changed

- Changes in existing functionality

### Deprecated

- Soon-to-be removed features

### Removed

- Removed features

### Fixed

- Bug fixes

### Security

- Security vulnerability fixes and improvements
```

---

## Commit Message Convention

This project follows these commit message conventions:

- `feat:` - A new feature
- `fix:` - A bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring without feature changes
- `perf:` - Performance improvements
- `test:` - Test additions or modifications
- `chore:` - Build, dependencies, or other non-code changes
- `security:` - Security-related changes

Example: `feat: add enterprise slug automatic lookup`

---

## Releases

### How to Create a Release

1. **Update CHANGELOG.md** - Move items from "Unreleased" to new version
2. **Update version references** - In code comments, documentation
3. **Create Git tag** - Tag release with version (e.g., `v1.0.0`)
4. **Create GitHub Release** - Reference the tag and copy changelog entries
5. **Announce** - Notify users and stakeholders

### Release Notes Template

```markdown
# Release v1.0.0

**Released:** [Date]

## What's New

[Summary of major features and improvements]

## Changes

[Link to changelog section]

## Migration Guide (if breaking changes)

[Instructions for users to migrate]

## Contributors

Thank you to all contributors!
```

---

## Troubleshooting Release Issues

### If a release has issues:

1. Patch release - `v1.0.1` - for non-breaking bug fixes
2. Document issue - Update CHANGELOG with note about the issue
3. Release fix - Create new patch release with corrected code
4. Communicate - Notify affected users

### Rollback procedure:

1. Delete the problematic release tag
2. Create a new tag with corrected content
3. Update GitHub release
4. Notify users
