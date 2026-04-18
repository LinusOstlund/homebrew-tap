cask "lml" do
  version "0.2.0"
  sha256 "PLACEHOLDER_UNTIL_RELEASE"

  url "https://github.com/LinusOstlund/linus-markup-language/releases/download/v#{version}/LML-v#{version}-arm64.zip"
  name "LML"
  desc "macOS menu bar app for wrapping selected text in XML tags"
  homepage "https://github.com/LinusOstlund/linus-markup-language"

  depends_on macos: ">= :sonoma"

  app "LML.app"

  caveats <<~EOS
    LML needs Accessibility access to read and replace selected text.
    Grant it at: System Settings → Privacy & Security → Accessibility
  EOS
end
