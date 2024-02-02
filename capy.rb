# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Capy < Formula
  desc "Copilot to build antifragile system"
  homepage "https://tryantifragile.ai/"
  url "https://github.com/AntiFragile-AI/copilot/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "75c1335d369b23817b8d46780a5c9340c868b649d19c138a32b0e9376ce249bc"
  license "AntiFragile-AI"

  # depends_on "cmake" => :build
  depends_on "python"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    bin.install "./capy_script.sh" => "capy"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test Capy`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/capy", "--version"
  end
end
