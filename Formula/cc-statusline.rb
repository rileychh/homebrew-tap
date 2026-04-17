class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "b471baaec6dfc278cc79ebbef10acd89efea868ce181e380c4e1fcd7331f6dd0"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

  bottle do
    root_url "https://github.com/rileychh/homebrew-tap/releases/download/cc-statusline-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2636ae5804b69ef249c85fc6f28232b7fbb8654c87477e73507a48fed3bc1de8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "45e0fdcf55e0a814ef8ac2b82914acf15ed4573874f2ba55f848c9b6fa4ee689"
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
