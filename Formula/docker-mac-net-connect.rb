# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DockerMacNetConnect < Formula
  desc "Connect directly to Docker-for-Mac containers via IP address 🐳 💻"
  homepage "https://github.com/chipmk/docker-mac-net-connect"
  url "https://github.com/chipmk/docker-mac-net-connect/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "efda413c854b0dd9e7cff376747b2ad9b785a3d8f62dbc9ca8520f32df6140c6"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  service do
    run opt_bin/"docker-mac-net-connect"
    log_path var/"log/docker-mac-net-connect/std_out.log"
    error_log_path var/"log/docker-mac-net-connect/std_error.log"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test docker-mac-net-connect`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
