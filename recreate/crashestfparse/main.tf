# Recreate issue
locals {
    sensitive-thing = sensitive("FAKE-SENSITIVE-VALUE")
}