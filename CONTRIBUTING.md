# Contributing to GitHub Enterprise Organization Terraform Module

Thank you for your interest in contributing to this Terraform module! This document provides guidelines and instructions for contributing.

## Code of Conduct

We are committed to maintaining a respectful and inclusive community. All contributors are expected to adhere to professional standards and treat others with respect.

## Getting Started

1. **Fork the repository** - Create your own fork to work on
2. **Clone your fork** - Clone to your local machine
3. **Create a feature branch** - Use descriptive branch names (e.g., `feature/add-webhook-support`, `fix/enterprise-id-lookup`)
4. **Make your changes** - Follow the guidelines below
5. **Test your changes** - Ensure all tests pass
6. **Submit a pull request** - Include a clear description of your changes

## Development Environment Setup

### Prerequisites

- Terraform >= 1.6.0
- GitHub provider >= 6.8.3
- Git
- (Optional) `tflint` for linting
- (Optional) `terraform fmt` for formatting

### Installation

```bash
# Clone the repository
git clone https://github.com/your-org/crt-tfm-ghe-enterprise-organization.git
cd crt-tfm-ghe-enterprise-organization

# Initialize Terraform
terraform init

# Initialize examples
cd examples/basic && terraform init && cd ../..
cd examples/comprehensive && terraform init && cd ../..
```

## Making Changes

### Code Style and Conventions

This module follows the [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/style) and the conventions defined in [terraform.instructions.md](./.github/instructions/terraform.instructions.md).

Key conventions:

- **Indentation**: Use 2 spaces
- **Formatting**: Run `terraform fmt` before committing
- **Variable Organization**: Alphabetize variables within sections
- **Comments**: Include clear comments for complex logic
- **Naming**: Use descriptive names for resources, variables, and outputs

### File Organization

The module follows this structure:

```
.
├── main.tf                    # Primary resources (providers, data sources, main resources)
├── variables.tf               # Input variables
├── outputs.tf                 # Output values
├── providers.tf              # Provider requirements
├── terraform.tfvars.example  # Example values
├── examples/
│   ├── basic/               # Basic usage example
│   └── comprehensive/       # Advanced usage example
└── README.md               # Documentation
```

### Adding Features

When adding new features:

1. **Update variables.tf** - Add new input variables with clear descriptions
2. **Update main.tf** - Add or modify resources
3. **Update outputs.tf** - Export relevant values
4. **Update examples** - Demonstrate usage in both basic and comprehensive examples
5. **Update README.md** - Document the new feature
6. **Update CHANGELOG.md** - Add entry under "Unreleased"

### Modifying Existing Code

When modifying existing code:

1. Maintain backward compatibility where possible
2. Update affected examples
3. Update documentation
4. Add/update comments explaining the change
5. Test thoroughly

## Testing

### Validate Configuration

```bash
# Validate the module
terraform validate

# Validate examples
cd examples/basic && terraform validate
cd ../comprehensive && terraform validate
```

### Format Check

```bash
# Check formatting
terraform fmt -check

# Auto-format
terraform fmt -recursive
```

### Lint with tflint (Optional)

```bash
# Initialize tflint
tflint --init

# Run linting
tflint
```

### Manual Testing

For changes that affect actual GitHub operations:

1. Create a test GitHub Enterprise organization
2. Apply the configuration with your changes
3. Verify the organization was created/configured correctly
4. Destroy the test organization

## Documentation

### README.md Updates

When adding features that affect usage:

1. Update the Features section if applicable
2. Add/update usage examples
3. Update the module structure if new files are added
4. Update prerequisites if new dependencies are needed

### Inline Comments

Write clear comments for:

- Complex resource configurations
- Conditional logic (e.g., when enterprise_id vs enterprise_slug is used)
- Security-relevant settings
- Design decisions

### CHANGELOG.md

Add entries to the "Unreleased" section following [Keep a Changelog](https://keepachangelog.com/) format:

```markdown
### Added

- New feature description

### Changed

- Modified behavior description

### Fixed

- Bug fix description

### Security

- Security-related changes
```

## Pull Request Process

### Before Submitting

1. **Validate all code**

   ```bash
   terraform validate
   terraform fmt -recursive -check
   ```

2. **Test locally** - Ensure examples still work

3. **Update documentation** - README, examples, inline comments

4. **Update CHANGELOG.md** - Document your changes

### PR Description

Include in your PR description:

- **What**: Clear description of the changes
- **Why**: Motivation and context
- **How**: Technical approach
- **Testing**: How you tested the changes
- **Backward Compatibility**: Any breaking changes noted

### Example PR Title

- `feat: add support for enterprise slug lookup`
- `fix: correct enterprise organization resource attribute`
- `docs: update examples with security best practices`
- `refactor: simplify variable validation logic`

### Review Process

1. A maintainer will review your PR
2. Provide feedback and request changes if needed
3. Once approved and all checks pass, the PR will be merged
4. Your changes will be included in the next release

## Security Considerations

When contributing security-related changes:

1. **Mark sensitive variables** - Use `sensitive = true` for secrets
2. **Validate inputs** - Add validation blocks for important variables
3. **Follow principle of least privilege** - Default to most restrictive settings
4. **Document security implications** - Explain security impacts in comments
5. **Test with security in mind** - Consider attack vectors and edge cases

## Reporting Issues

When reporting bugs or requesting features:

1. **Use clear titles** - Describe the issue concisely
2. **Provide context** - Include Terraform version, provider version
3. **Minimal reproduction** - Provide steps to reproduce
4. **Expected vs actual** - Clearly state expected and actual behavior
5. **Logs and errors** - Include relevant error messages

## Questions or Need Help?

- Review existing [issues](../../issues) and [pull requests](../../pull-requests)
- Check the [README.md](./README.md) for documentation
- Check [TESTING.md](./TESTING.md) for testing guidelines

## Release Process

Maintainers follow semantic versioning:

- **Major**: Breaking changes
- **Minor**: New features (backward compatible)
- **Patch**: Bug fixes and minor improvements

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

## Thank You!

Your contributions help make this module better for everyone. We appreciate your time and effort!
