# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DockerMacNetConnect < Formula
  desc "Connect directly to Docker-for-Mac containers via IP address 🐳 💻"
  homepage "https://github.com/chipmk/docker-mac-net-connect"
  version "v0.1.4"
  url "https://github.com/chipmk/docker-mac-net-connect/archive/refs/tags/#{version}.tar.gz"
  sha256 "291ccf1b694c645074e65a8008c918c140e4c095fbfe4a9e248c168940ef62df"
  license "MIT"

  depends_on "go" => :build

  def install
    if ENV["HOMEBREW_GOPROXY"]
      ENV["GOPROXY"] = ENV["HOMEBREW_GOPROXY"]
    end

    system "make", "VERSION=#{version}", "build-go"
    
    bin.install Dir["*"]
  end

  service do
    keep_alive true
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
