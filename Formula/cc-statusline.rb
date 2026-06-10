class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "c55b07c14d2d3716c1fa406c70bb1df055991394f03752e8f62a55fe89d8faea"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "04d064e10bd3db36b562125447b31f63a8ed4848369588672cc5897cc4e760e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b82f530762bc09477d6a9d30843c160623288bb0bcee1056b42e628a1a069ac2"
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
