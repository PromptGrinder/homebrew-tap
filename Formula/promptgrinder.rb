class Promptgrinder < Formula
  desc "Run AI prompts as deterministic, reviewable engineering workflows"
  homepage "https://github.com/PromptGrinder/promptgrinder"
  url "https://github.com/PromptGrinder/promptgrinder/archive/refs/tags/v1.0.0-rc.6.4.tar.gz"
  version "1.0.0-rc.6.4"
  sha256 "9e0c004763023fe0a38017cd8b461f70e5b33b20881041f6bc6fac8cde05445d"
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
