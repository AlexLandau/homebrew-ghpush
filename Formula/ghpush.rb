class Ghpush < Formula
  desc "Tool for pushing commits to GitHub as stacks of dependent pull requests"
  homepage "https://github.com/AlexLandau/ghpush"
  url "https://github.com/AlexLandau/ghpush/archive/0.0.14.tar.gz"
  sha256 "0fa18b90ea9e81ed394f6bfe336ff14e265c2afd2f6b7b9f113509bc1f5fc5b8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/AlexLandau/homebrew-ghpush/releases/download/ghpush-0.0.14"
    sha256 cellar: :any,                 big_sur:      "0789a42ceaa5ac716ea24ebe10bc0a08a015be59b39b9448f8bb7df3961d3172"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ead0dc0089999011c1e34f98a615397b3756fec8661f72b6645a265b88a2bee1"
  end

  depends_on "gradle" => :build
  depends_on "openjdk" => :build
  depends_on "gh"
  depends_on "zlib"

  def install
    # TODO: Make an alternative for passing in the version for --version
    ENV["GITHUB_REF_TYPE"] = "tag"
    ENV["GITHUB_REF_NAME"] = version

    system "gradle", "nativeImage"
    bin.install "build/graal/ghpush"
  end

  test do
    # TODO: Add an actual test
    system "true"
  end
end
