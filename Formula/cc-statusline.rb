class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d6236cf8cf23c8419cab0e59e597a20e532ecc1b5ff1319f36e2dcd0d995c4a4"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "58f128fcc5bfdd66d9788e3db752140e99aafebd6f7ebba1bdc8d88442c31cb2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "42bb0d4659830d3786b73ff2b730a563f9ffcfd5f591188fbf3606d957d160ef"
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
