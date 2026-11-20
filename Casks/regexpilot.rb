cask "regexpilot" do
  version "1.5"
  sha256 "9671409247731c61285acaea731582b1f2f5673bb3289e72209d0bae64e0e2c3"

  # No `verified:` — Homebrew deprecated it. If you ever re-add and remove it
  # by hand, drop the TRAILING COMMA on the url line with it: Ruby then parses
  # `url("...", name("RegexPilot"))` and the tap stops being valid Ruby for
  # every user, which shipped once on 2026-09-06. This file is the SOURCE;
  # release.sh copies it into the tap verbatim.
  url "https://pub-013d2816deaa41b0b7403efaa3d9a6e9.r2.dev/RegexPilot-#{version}-universal.dmg"
  name "RegexPilot"
  desc "Visual regex builder that runs patterns against 21 language engines"
  homepage "https://regexpilot.com/"

  livecheck do
    url "https://regexpilot.com/"
    regex(/v?(\d+(?:\.\d+)+)(?:<!--\s*-->)?\s*·\s*out now/i)
    strategy :page_match
  end

  auto_updates true
  depends_on macos: :sonoma

  app "RegexPilot.app"

  uninstall quit: "com.regexpilot.app"

  zap trash: [
    "~/Library/Application Support/com.regexpilot.app",
    "~/Library/Caches/com.regexpilot.app",
    "~/Library/Preferences/com.regexpilot.app.plist",
    "~/Library/WebKit/com.regexpilot.app",
  ]
end
