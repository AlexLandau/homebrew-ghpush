class Ghpush < Formula
  desc "Tool for pushing commits to GitHub as stacks of dependent pull requests"
  homepage "https://github.com/AlexLandau/ghpush"
  url "https://github.com/AlexLandau/ghpush/archive/0.1.0.tar.gz"
  sha256 "9f82615a558ea35fd076452d24a7480b20ce906a62e49c5d75148d79044764e5"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/AlexLandau/homebrew-ghpush/releases/download/ghpush-0.1.0"
    sha256 cellar: :any,                 big_sur:      "1befd80c1b320804b0e8518552b36f24ba547de5911b43ce23a02e3aba4c02d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4138d534159c77c7e4903f657839fb2caf422e692e74512962bca84cdcc98334"
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
