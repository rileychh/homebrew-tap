class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "b0cb57fdcdb6e484185a25d60b460595c148b01add47fd1be48b7be9a4de2f68"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.3.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "542169bdc67055f01fc469b60d222d12f3af0765b71650b75908e272fa120777"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2974e0ea628935a5623b7e586d50446984b1a859349e152d1bb76307b79d4219"
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
