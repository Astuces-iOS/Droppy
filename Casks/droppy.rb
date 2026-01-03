cask "droppy" do
  version "2.1.2"
  sha256 "4ce68aa020e81e40437cdf1889383986b98f5cff033d946d1724ed51ef8d6482"

  url "https://raw.githubusercontent.com/iordv/Droppy/main/Droppy-2.1.2.dmg"
  name "Droppy"
  desc "Drag and drop file shelf for macOS"
  homepage "https://github.com/iordv/Droppy"

  app "Droppy.app"

  zap trash: [
    "~/Library/Application Support/Droppy",
    "~/Library/Preferences/iordv.Droppy.plist",
  ]
end
