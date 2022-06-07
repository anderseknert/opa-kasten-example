# METADATA
# description: something here
package eval

deny[message] {
    some name
    result := data.policy[name].deny[_]
    message := sprintf("%v: %v", [name, result])
}

