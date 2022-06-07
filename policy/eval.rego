# METADATA
# description: something here
package eval

deny[message] {
    message := data.policy[_].deny[_]
}
