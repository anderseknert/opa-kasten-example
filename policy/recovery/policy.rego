package policy.recovery

import future.keywords

deny["Policy must include backup action"] {
    input.request.kind.kind == "Policy"
    input.request.kind.group == "backup.io"
    not has_backup_policy
}

has_backup_policy {
    some action in input.request.object.spec.actions
    action.action == "backup"
}