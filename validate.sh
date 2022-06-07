#!/usr/bin/env bash

exit_code=0

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
        echo "Policy validation failure in $filename"
        echo "Output: $result"
        exit_code=1
    fi
done

exit "$exit_code"