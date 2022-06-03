#!/usr/bin/env bash

exit_code=0

for dir in ./*/; do
    result=$(kube-review create "$dir"input.yaml | opa eval -f raw -I -d "$dir"policy.rego 'data.policy.allow')

    if [ "$result" != "true" ]; then
        echo "Policy validation failure in $dir"
        exit_code=1
    fi
done

exit "$exit_code"