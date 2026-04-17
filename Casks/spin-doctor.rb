cask "spin-doctor" do
  version "0.3.1"
  sha256 "e2108bc2137ecff54e13f31c44d3e7d483324a980ab4130e1963c11dbc114c1b"

  url "https://github.com/rileychh/spin-doctor/releases/download/v#{version}/SpinDoctor.dmg"
  name "Spin Doctor"
  desc "Menu bar app that detects busy-loop processes and offers to kill them"
  homepage "https://github.com/rileychh/spin-doctor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Spin Doctor.app"

  uninstall quit: "com.spindoctor.app"

  zap trash: "~/.config/spin_doctor"
end
