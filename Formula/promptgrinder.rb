class Promptgrinder < Formula
  desc "Run AI prompts as deterministic, reviewable engineering workflows"
  homepage "https://github.com/PromptGrinder/promptgrinder"
  url "https://github.com/PromptGrinder/promptgrinder/archive/refs/tags/v1.0.0-rc.4.2.tar.gz"
  version "1.0.0-rc.4.2"
  sha256 "e25379beefb0ec411d3c18899b39d1642a16a77b6a64ea434decab27af56d23f"
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
