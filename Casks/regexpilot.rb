cask "regexpilot" do
  version "0.0.0-rc13"
  sha256 "5506a296d8fcbeb2fa58c7c4f67d6e3d92f82f57805969e9093cfe30176f21d3"

  url "https://pub-013d2816deaa41b0b7403efaa3d9a6e9.r2.dev/RegexPilot-latest-universal.dmg"
  name "RegexPilot"
  desc "Visual regex builder that runs patterns against 21 authentic language engines"
  homepage "https://regexpilot.com"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "RegexPilot.app"

  zap trash: [
    "~/Library/Application Support/com.regexpilot.app",
    "~/Library/Caches/com.regexpilot.app",
    "~/Library/Preferences/com.regexpilot.app.plist",
    "~/Library/WebKit/com.regexpilot.app",
  ]
end
