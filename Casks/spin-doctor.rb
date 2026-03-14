cask "spin-doctor" do
  version "0.2.1"
  sha256 "163904b4c2afa7faf441f30a7db12a0cff2b3008b335281f283e646cefa3fe08"

  url "https://github.com/rileychh/spin-doctor/releases/download/v#{version}/SpinDoctor.dmg"
  name "Spin Doctor"
  desc "Menu bar app that detects busy-loop processes and offers to kill them"
  homepage "https://github.com/rileychh/spin-doctor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Spin Doctor.app"

  uninstall quit: "com.spindoctor.app"

  zap trash: "~/.config/spin_doctor"
end
