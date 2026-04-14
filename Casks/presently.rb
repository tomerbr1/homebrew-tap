cask "presently" do
  version "2.0.0"
  sha256 "11202b684fe0fc4a1b113a43e8a86f17142747ad031c0252dd34c0fbcc154d71"

  url "https://github.com/tomerbr1/presently/releases/download/v#{version}/Presently-v#{version}.zip"
  name "Presently"
  desc "macOS menu bar app for automatic Slack presence management"
  homepage "https://github.com/tomerbr1/presently"

  app "Presently.app"

  zap trash: [
    "~/.presently",
  ]
end
