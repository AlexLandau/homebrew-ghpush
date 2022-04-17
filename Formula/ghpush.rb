class Ghpush < Formula
  desc "Tool for pushing commits to GitHub as stacks of dependent pull requests"
  homepage "https://github.com/AlexLandau/ghpush"
  url "https://github.com/AlexLandau/ghpush/archive/0.0.13.tar.gz"
  sha256 "983e2fbbae6c3023d8e9f4501eef367027dbf465b439250432eb45a9d1b6bdc8"
  license "Apache-2.0"

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
