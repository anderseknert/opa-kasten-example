package policy

import input.request.object as object

import future.keywords

default allow := false

allow {
    input.request.object.spec.cloudprovider == "aws"
    input.request.object.spec.advanced["object-lock"] == true
}


allow {
    input.request.object.spec.cloudprovider == "aws"
    input.request.object.spec.advanced["air-gap"] == true
}
