class Ghpush < Formula
  desc "Tool for pushing commits to GitHub as stacks of dependent pull requests"
  homepage "https://github.com/AlexLandau/ghpush"
  url "https://github.com/AlexLandau/ghpush/archive/0.1.1.tar.gz"
  sha256 "d460c7a1056a6c950630f4f2fbbc25cab21e32c77d28dfe9aace5f3edc80eeb1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/AlexLandau/homebrew-ghpush/releases/download/ghpush-0.1.1"
    sha256 cellar: :any,                 monterey:     "e4002f04a8f373d39721cd1b85471e746b9171f55d59ee364907035baf5d428c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bd9ba954c8db3783153f200facf76e24e9ddf9988144251a59cbc7034f696331"
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
