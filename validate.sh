#!/usr/bin/env bash

exit_code=0

if [ $(which kube-review) ]; then
    kr=$(which kube-review)
else
    kr=bin/kube-review
fi

for dir in ./*/; do
    if [ "$dir" == "./bin/" ]; then
        continue
    fi

    result=$($kr create "$dir"input.yaml | opa eval -f raw -I -d "$dir"policy.rego 'data.policy.allow')

    if [ "$result" != "true" ]; then
        echo "Policy validation failure in $dir"
        echo "Output: $result"
        exit_code=1
    fi
done

exit "$exit_code"