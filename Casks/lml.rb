cask "lml" do
  version "0.1.1"
  sha256 "b0643cbdab7ef8e557b90cb5976dd135ba59c3ee3378befc9dd12a8a1a09d188"

  url "https://github.com/LinusOstlund/linus-markup-language/releases/download/v#{version}/LML-v#{version}-arm64.zip"
  name "LML"
  desc "macOS menu bar app for wrapping selected text in XML tags"
  homepage "https://github.com/LinusOstlund/linus-markup-language"

  depends_on macos: ">= :sonoma"

  app "LML.app"

  caveats <<~EOS
    If macOS shows "LML Not Opened" on first launch, run:
      xattr -cr /Applications/LML.app && open /Applications/LML.app

    LML needs Accessibility access to read and replace selected text.
    Grant it at: System Settings → Privacy & Security → Accessibility
  EOS
end
