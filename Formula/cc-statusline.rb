class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "0f089c60fc6d9f972fdc216d7c8104e451c58922e32273c76c5716ceb384a996"
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
