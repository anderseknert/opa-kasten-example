package policy

import future.keywords

allow {
    input.request.spec.cloudprovider == "aws"
    input.request.spec.advanced["object-lock"] == true
}


allow {
    input.request.spec.cloudprovider == "aws"
    input.request.spec.advanced["air-gap"] == true
}
