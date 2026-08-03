class Promptgrinder < Formula
  desc "Run AI prompts as deterministic, reviewable engineering workflows"
  homepage "https://github.com/PromptGrinder/promptgrinder"
  url "https://github.com/PromptGrinder/promptgrinder/archive/refs/tags/v1.0.0-rc.2.3.tar.gz"
  version "1.0.0-rc.2.3"
  sha256 "cd1ca98f253f00741667258198fced5d2b45293c5eca902d4fa0a6bb6b389b20"
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
