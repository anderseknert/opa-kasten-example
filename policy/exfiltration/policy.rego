package policy.exfiltration

import future.keywords

allowed_namespaces := {"prod-copy"}

deny["Restore operation outside of allowed namespace"] {
    input.request.kind.kind == "RestoreJob"
    has_restore_action

    not in_allowed_namespace
}

in_allowed_namespace {
    input.request.object.spec.target.namespace in allowed_namespaces
}

has_restore_action {
    restore_actions := {action |
        some action in input.request.object.spec.actions
        action.action == "restore"
    }
    count(restore_actions) > 0
}
