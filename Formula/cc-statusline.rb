class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "05c7ad68a3d1425871fe3c65fa13497472e56c0a32ee95ffb4c4726a41224bba"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2bab600528bbc9f2be4953d1eebb8dd3188fc3e1e6f752d2aaf536788f72aa14"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9b9cedbf6533eae25ed159c7a9bed28978147162e47802940b44d6261253ccda"
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
