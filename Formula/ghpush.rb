# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ghpush < Formula
    # TODO: Description
    desc ""
    homepage "https://github.com/AlexLandau/ghpush"
    url "https://github.com/AlexLandau/ghpush/archive/v0.0.4.tar.gz"
    sha256 "24e2c7287f3f8732b04344ce36cbb2b9f9cd75afbef8be67848b80d35efd38c6"
    license "Apache-2.0"
  
    # depends_on "cmake" => :build
    # TODO: Verify these
    depends_on "gradle" => :build
    depends_on "openjdk" => :build
  
    def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      # Remove unrecognized options if warned by configure
      # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
      # system "./configure", *std_configure_args, "--disable-silent-rules"
      # system "cmake", "-S", ".", "-B", "build", *std_cmake_args

      # TODO: Make an alternative for passing in the version for --version
      ENV["GITHUB_REF_TYPE"] = "tag"
      ENV["GITHUB_REF_NAME"] = "v0.0.4"

      system "gradle", "nativeImage"
      bin.install "build/graal/ghpush"
    end
  
    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test ghpush`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
  