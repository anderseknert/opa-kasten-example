package policy

import future.keywords

allow {
    input.request.kind.kind == "Policy"
    input.request.kind.group == "backup.io"
    has_backup_policy
}

has_backup_policy {
    some action in input.request.object.spec.actions
    action.action == "backup"
}