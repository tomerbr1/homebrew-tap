cask "presently" do
  version "2.0.1"
  sha256 "376818b87e570343ce30fbb72386aa3678949f3498a0d817870d412857d0c7ae"

  url "https://github.com/tomerbr1/presently/releases/download/v#{version}/Presently-v#{version}.zip"
  name "Presently"
  desc "macOS menu bar app for automatic Slack presence management"
  homepage "https://github.com/tomerbr1/presently"

  app "Presently.app"

  zap trash: [
    "~/.presently",
  ]
end
