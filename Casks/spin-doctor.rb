cask "spin-doctor" do
  version "0.3.2"
  sha256 "941aec36955e6b2d61899efbc95e00021dafc5ca1812f5aa271c10f58a1dc7be"

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
