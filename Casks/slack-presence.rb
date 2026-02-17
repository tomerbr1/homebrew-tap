cask "slack-presence" do
  version "1.8"
  sha256 "237b2cc76c467c9ef185612661958338323fffe6c8a9c7a262448b438c648c20"

  url "https://github.com/tomerbr1/slack-presence/releases/download/v#{version}/SlackPresence-v#{version}.zip"
  name "SlackPresence"
  desc "macOS menu bar app for automatic Slack presence management"
  homepage "https://github.com/tomerbr1/slack-presence"

  app "SlackPresence.app"

  zap trash: [
    "~/.slackpresence",
    "~/Library/LaunchAgents/com.user.SlackPresence.plist",
    "~/Library/Logs/SlackPresence",
  ]
end
