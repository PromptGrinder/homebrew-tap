class Promptgrinder < Formula
  desc "Run AI prompts as deterministic, reviewable engineering workflows"
  homepage "https://github.com/PromptGrinder/promptgrinder"
  url "https://github.com/PromptGrinder/promptgrinder/archive/refs/tags/v1.0.0-rc.3.0.tar.gz"
  version "1.0.0-rc.3.0"
  sha256 "17eb5aa387286c6a389bf25a45bba140452071d8793407afcec188043c23b21a"
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
