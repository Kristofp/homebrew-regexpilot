cask "regexpilot" do
  version "1.3"
  sha256 "0da4fc955b74aff16296e066661863a8ab9b5a95644208cfd1ffd38198c72f0f"

  # NO `verified:` HERE. Homebrew deprecated the parameter — the default URL
  # verification behaviour replaces it, and a cask that still passes it emits
  # a deprecation warning on every `brew` invocation that touches this file.
  #
  # If you remove it again by hand, remove the TRAILING COMMA on the url line
  # with it. Ruby continues an argument list across a newline after a comma,
  # so `url "...",` followed by `name "RegexPilot"` parses as
  # `url("...", name("RegexPilot"))` and the file stops being valid Ruby
  # entirely — `brew install --cask regexpilot` then fails for every user of
  # the tap, not just with a warning. That happened on 2026-09-06; the tap
  # carried a syntax error until it was caught here.
  #
  # This file is the SOURCE. `homebrew/push.sh` and `scripts/release.sh`
  # both `cp` it verbatim into the tap, so a fix applied only in
  # ~/Library/Taps/... is overwritten by the next release.
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

  zap trash: [
    "~/Library/Application Support/com.regexpilot.app",
    "~/Library/Caches/com.regexpilot.app",
    "~/Library/Preferences/com.regexpilot.app.plist",
    "~/Library/WebKit/com.regexpilot.app",
  ]
end
