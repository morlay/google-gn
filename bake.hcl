variable VERSION {
  default = "9a0496a7"
}

target "default" {
  context = "."
  dockerfile = "Dockerfile"
  tags = [
    "morlay/google-gn:${VERSION}"
  ]
  args = {
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7"
  ]
}
