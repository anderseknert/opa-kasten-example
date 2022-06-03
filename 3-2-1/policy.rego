package policy

import future.keywords

allow {
    input.request.object.kind == "Policy"
    spec := input.request.object.spec
    actions := [action |
        action := spec.actions[_].action
    ]
    "backup" in actions
    "backup-copy" in actions
}
