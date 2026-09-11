class Promptgrinder < Formula
  desc "Run AI prompts as deterministic, reviewable engineering workflows"
  homepage "https://github.com/PromptGrinder/promptgrinder"
  url "https://github.com/PromptGrinder/promptgrinder/archive/refs/tags/v1.0.0-rc.6.5.tar.gz"
  version "1.0.0-rc.6.5"
  sha256 "c5b0dc4a6a8cae61c184a38748845fdabba5073018cac930b9ab782794303e4b"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X promptgrinder/internal/buildinfo.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/promptgrinder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/promptgrinder --version")
  end
end
