class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2be66c0d8c187bfa9b047a02b70a2e32a142e291d4c9b13607baa7c5090ec0ee"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "78a441cd37b93f9d7f26bcbadbc751c7ada6909a7bbacd86435056bcbebf5ed9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0faca9f70b78a5a4eff0f0ade0873dd5f8d7ea0e94384430d5ebc80a22ab915"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    input = '{"model":{"display_name":"Opus"}}'
    output = pipe_output(bin/"cc-statusline", input)
    assert_match "Opus", output
  end
end
