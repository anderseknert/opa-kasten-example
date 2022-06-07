#!/usr/bin/env bash

exit_code=0

function error() {
    local filename=$1
    local result=$2
    if [ "$GITHUB_ACTIONS" == "true" ]; then
        echo "::error file={$filename},title={Policy violation}::{$result}"
    else
        echo "Policy violation in $filename: $result"
    fi
}

if [ $(which kube-review) ]; then
    kr=$(which kube-review)
else
    kr=bin/kube-review
fi

for file in ./manifests/*; do
    filename=$(basename "$file")
    echo "Validating $filename"

    result=$($kr create "$file" | opa eval -f raw -I -d policy/ 'data.eval.deny')

    if [ "$result" != "[]" ]; then
        echo
        error "$filename" "$result"
        echo
        exit_code=1
    fi
done

if [ "$exit_code" == "0" ]; then
    echo
    echo "No violations found"
fi

exit "$exit_code"