cask "spin-doctor" do
  version "0.3.3"
  sha256 "b0328eee05107bd45b913af19f9b928e23f11ecd69069586cc74da48b63f68fe"

  url "https://github.com/rileychh/spin-doctor/releases/download/v#{version}/SpinDoctor.dmg"
  name "Spin Doctor"
  desc "Menu bar app that detects busy-loop processes and offers to kill them"
  homepage "https://github.com/rileychh/spin-doctor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Spin Doctor.app"

  uninstall quit: "com.spindoctor.app"

  zap trash: "~/.config/spin_doctor"
end
