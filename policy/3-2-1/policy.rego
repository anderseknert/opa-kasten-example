package policy.three_two_one

import future.keywords

deny["Policy resource must include both backup and backup-copy actions"] {
    input.request.object.kind == "Policy"
    not has_backup_and_backup_copy_actions
}

has_backup_and_backup_copy_actions {
    actions := [action | action := input.request.object.spec.actions[_].action]
    "backup" in actions
    "backup-copy" in actions
}
