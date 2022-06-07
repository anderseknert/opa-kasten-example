# OPA policy enforcement for Kasten

Examples of policy enforcement for data protection purposes, enforcing:

* Backup policies are in place
* Appropriate backup targets are configured
* Restore can only be performed in allowed namespaces

The repository also includes a simple enforcement mechanism to be run on
GitHub pull requests using GitHub Actions.

## Repository Content

* `manifests` - Contains the manifest files to be checked
* `policy` - Rego policies to run on manifests
* `validate.sh` - Simple script that verifies each manifest against policy

