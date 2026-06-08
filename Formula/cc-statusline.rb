class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "05c7ad68a3d1425871fe3c65fa13497472e56c0a32ee95ffb4c4726a41224bba"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.4.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e70674f850a2224b6cd1a78efe38caeb6e6a0f17bde8eeff8fdbe57117634824"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b4addc1f56a7566444ed6de1081acacd3206b7808130f0716f3d7ea216ad8d1"
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
