group "build" {
  targets = ["noble", "jammy", "alpine", "centos7"]
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
