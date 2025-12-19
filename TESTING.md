## Testing

This module includes example configurations that can be used for testing.

### Manual Testing

## Prerequisites

- GitHub Personal Access Token or GitHub App with `admin:org` permissions
- Access to a GitHub Enterprise organization

## Basic Test

```bash
cd examples/basic
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your organization details
terraform init
terraform plan
terraform apply
terraform destroy
```

## Complete Test

```bash
cd examples/complete
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your organization details
terraform init
terraform plan
terraform apply
terraform destroy
```

### Automated Testing

For automated testing in CI/CD pipelines:

```bash
# Format check
terraform fmt -check -recursive

# Validation
terraform init -backend=false
terraform validate

# Linting
tflint --init
tflint --config .tflint.hcl

# Security scanning (if checkov is installed)
checkov -d . --quiet
```

### Test Checklist

Before releasing changes, verify:

- [ ] All variables have appropriate defaults
- [ ] All outputs are correctly defined
- [ ] Examples run successfully
- [ ] Documentation is up to date
- [ ] CHANGELOG is updated
- [ ] Pre-commit hooks pass
- [ ] No sensitive data in code or examples
- [ ] Provider version constraints are appropriate
- [ ] Resource configurations follow best practices
