# Homebrew Tap

Personal Homebrew tap for macOS tools.

## Install

```bash
brew install --cask tomerbr1/tap/presently
```

## Available Casks

| Cask | Version | Description |
|------|---------|-------------|
| presently | 2.0.0 | macOS menu bar app for automatic Slack presence management |

---

## Maintenance

### Releasing a new version of Presently

#### 1. Build the app

Open `Presently.xcodeproj` in Xcode, bump the version in project settings (`MARKETING_VERSION` and `CURRENT_PROJECT_VERSION`), then:

- Product -> Archive
- In the Organizer window, select the archive
- Distribute App -> Custom -> Copy App
- Choose an output directory

#### 2. Create the release zip

```bash
cd /path/to/exported/app
zip -r Presently-v<VERSION>.zip Presently.app
```

#### 3. Create the GitHub release

```bash
gh release create v<VERSION> Presently-v<VERSION>.zip \
  --repo tomerbr1/presently \
  --title "Presently v<VERSION>" \
  --notes "Release notes here"
```

#### 4. Update the cask

Get the SHA256 of the zip:

```bash
shasum -a 256 Presently-v<VERSION>.zip
```

Edit `Casks/presently.rb` - update `version` and `sha256`:

```ruby
cask "presently" do
  version "<VERSION>"
  sha256 "<SHA256>"
  # ... rest stays the same
end
```

Commit and push:

```bash
cd /path/to/homebrew-tap
git add Casks/presently.rb
git commit -m "Update presently to v<VERSION>"
git push
```

#### 5. Verify

```bash
brew update
brew upgrade --cask presently
```

### Quick reference

| Step | Command |
|------|---------|
| Build | Xcode -> Archive -> Distribute -> Copy App |
| Zip | `zip -r Presently-v<VER>.zip Presently.app` |
| Release | `gh release create v<VER> Presently-v<VER>.zip --repo tomerbr1/presently` |
| SHA | `shasum -a 256 Presently-v<VER>.zip` |
| Update cask | Edit `Casks/presently.rb` (version + sha256) |
| Verify | `brew update && brew upgrade --cask presently` |
