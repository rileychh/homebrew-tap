class CcStatusline < Formula
  desc "Claude Code statusline renderer with Nerd Font icons and OSC 8 hyperlinks"
  homepage "https://github.com/rileychh/cc-statusline"
  url "https://github.com/rileychh/cc-statusline/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2be66c0d8c187bfa9b047a02b70a2e32a142e291d4c9b13607baa7c5090ec0ee"
  license "MIT"
  head "https://github.com/rileychh/cc-statusline.git", branch: "main"

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
