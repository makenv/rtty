group "base" {
  targets = ["noble", "jammy", "alpine", "centos7"]
}

group build-all {
  targets = ["build", "build-static", "build-centos7", "build-static-centos7"]
}

# ===
target "centos7" {
  context = "misc/build"
  dockerfile = "Dockerfile.centos7"
  tags = ["ccr.ccs.tencentyun.com/muse/build:rtty-centos7"]
}

target "alpine" {
  context = "misc/build"
  dockerfile = "Dockerfile.alpine"
  tags = ["ccr.ccs.tencentyun.com/muse/build:rtty-alpine"]
}

target "noble" {
  context = "misc/build"
  dockerfile = "Dockerfile.noble"
  tags = ["ccr.ccs.tencentyun.com/muse/build:rtty-noble"]
}

target "jammy" {
  context = "misc/build"
  dockerfile = "Dockerfile.jammy"
  tags = ["ccr.ccs.tencentyun.com/muse/build:rtty-jammy"]
}

target "build-noble" {
  context = "."
  dockerfile = "misc/build/Dockerfile.build"
  contexts = {
    build-image = "target:noble"
  }
  args = {
    BUILD_NAME = "noble"
  }
  output = ["."]
}


target "build" {
  matrix = {
    os = ["jammy", "alpine", "noble"]
  }
  name = "build-${os}"
  context = "."
  dockerfile = "misc/build/Dockerfile.build"
  contexts = {
    build-image = "target:${os}"
  }
  args = {
    BUILD_NAME = "${os}"
  }
  output = ["."]
}


target "build-static" {
  matrix = {
    os = ["jammy", "alpine", "noble"]
  }
  name = "build-static-${os}"
  context = "."
  dockerfile = "misc/build/Dockerfile.build"
  contexts = {
    build-image = "target:${os}"
  }
  args = {
    BUILD_NAME = "${os}-static"
    BUILD_STAGIC = "yes"
  }
  output = ["."]
}

target "build-static-centos7" {
  context = "."
  dockerfile = "misc/build/Dockerfile.build.centos7"
  contexts = {
    build-image = "target:centos7"
  }
  args = {
    BUILD_NAME = "centos7-static"
    BUILD_STAGIC = "yes"
  }
  output = ["."]  
}

target "build-centos7" {
  context = "."
  dockerfile = "misc/build/Dockerfile.build.centos7"
  contexts = {
    build-image = "target:centos7"
  }
  args = {
    BUILD_NAME = "centos7"
  }
  output = ["."]  
}
