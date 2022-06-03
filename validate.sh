#!/usr/bin/env bash

exit_code=0

for dir in ./*/; do
    result=$(opa eval -f raw -d "$dir"policy.rego -i "$dir"input.json 'data.policy.allow')

    if [ "$result" != "true" ]; then
        echo "Policy validation failure in $dir"
        exit_code=1
    fi
done

exit "$exit_code"