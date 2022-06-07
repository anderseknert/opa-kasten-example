package policy.ransomware

import future.keywords

deny["BackupTarget must specify either object-lock or air-gap"] {
    is_aws_backup_target
    not has_object_lock_or_airgap
}

is_aws_backup_target {
    is_backup_target
    is_aws
}

is_backup_target {
    input.request.kind.kind == "BackupTarget"
}

is_aws {
    input.request.object.spec.cloudprovider == "aws"
}

has_object_lock_or_airgap {
    input.request.object.spec.advanced["object-lock"] == true
}

has_object_lock_or_airgap {
    input.request.object.spec.advanced["air-gap"] == true
}
