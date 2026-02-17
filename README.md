# Homebrew Tap

Personal Homebrew tap for macOS tools.

## Install

```bash
brew install --cask tomerbr1/tap/slack-presence
```

## Available Casks

| Cask | Version | Description |
|------|---------|-------------|
| slack-presence | 1.8 | macOS menu bar app for automatic Slack presence management |

---

## Maintenance

### Releasing a new version of SlackPresence

#### 1. Build the app

Open `SlackPresence.xcodeproj` in Xcode, bump the version in project settings (`MARKETING_VERSION` and `CURRENT_PROJECT_VERSION`), then:

- Product -> Archive
- In the Organizer window, select the archive
- Distribute App -> Custom -> Copy App
- Choose an output directory

#### 2. Create the release zip

```bash
cd /path/to/exported/app
zip -r SlackPresence-v<VERSION>.zip SlackPresence.app
```

#### 3. Create the GitHub release

```bash
gh release create v<VERSION> SlackPresence-v<VERSION>.zip \
  --repo tomerbr1/slack-presence \
  --title "SlackPresence v<VERSION>" \
  --notes "Release notes here"
```

#### 4. Update the cask

Get the SHA256 of the zip:

```bash
shasum -a 256 SlackPresence-v<VERSION>.zip
```

Edit `Casks/slack-presence.rb` - update `version` and `sha256`:

```ruby
cask "slack-presence" do
  version "<VERSION>"
  sha256 "<SHA256>"
  # ... rest stays the same
end
```

Commit and push:

```bash
cd /path/to/homebrew-tap
git add Casks/slack-presence.rb
git commit -m "Update slack-presence to v<VERSION>"
git push
```

#### 5. Verify

```bash
brew update
brew upgrade --cask slack-presence
```

### Quick reference

| Step | Command |
|------|---------|
| Build | Xcode -> Archive -> Distribute -> Copy App |
| Zip | `zip -r SlackPresence-v<VER>.zip SlackPresence.app` |
| Release | `gh release create v<VER> SlackPresence-v<VER>.zip --repo tomerbr1/slack-presence` |
| SHA | `shasum -a 256 SlackPresence-v<VER>.zip` |
| Update cask | Edit `Casks/slack-presence.rb` (version + sha256) |
| Verify | `brew update && brew upgrade --cask slack-presence` |
