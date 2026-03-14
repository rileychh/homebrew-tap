cask "spin-doctor" do
  version "0.1.0"
  sha256 :no_check

  url "https://github.com/rileychh/spin-doctor/releases/download/v#{version}/SpinDoctor.dmg"
  name "Spin Doctor"
  desc "Menu bar app that detects busy-loop processes and offers to kill them"
  homepage "https://github.com/rileychh/spin-doctor"

  app "Spin Doctor.app"

  uninstall quit: "com.spindoctor.app"

  zap trash: [
    "~/.config/spin_doctor",
  ]

  livecheck do
    url :url
    strategy :github_latest
  end
end
