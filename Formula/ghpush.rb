class Ghpush < Formula
  desc "Tool for pushing commits to GitHub as stacks of dependent pull requests"
  homepage "https://github.com/AlexLandau/ghpush"
  url "https://github.com/AlexLandau/ghpush/archive/v0.0.4.tar.gz"
  sha256 "24e2c7287f3f8732b04344ce36cbb2b9f9cd75afbef8be67848b80d35efd38c6"
  license "Apache-2.0"

  depends_on "gradle" => :build
  depends_on "openjdk" => :build
  depends_on "gh"

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
