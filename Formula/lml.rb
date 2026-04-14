class Lml < Formula
  desc "macOS menu bar app for wrapping selected text in XML tags"
  homepage "https://github.com/LinusOstlund/linus-markup-language"
  url "https://github.com/LinusOstlund/linus-markup-language/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5827d451058b4e9b3f970552b5665b41ebaeeee9ca23adb71baf343e2ee34ec3"
  license "MIT"
  head "https://github.com/LinusOstlund/linus-markup-language.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/LML" => "lml"
  end

  def caveats
    <<~EOS
      LML requires macOS 14 (Sonoma) or later and Accessibility permission
      to read and replace selected text.
      Grant access in: System Settings -> Privacy & Security -> Accessibility

      Start LML manually with:  lml
      Or run at login with:      brew services start lml
    EOS
  end

  service do
    run opt_bin/"lml"
    keep_alive true
    process_type :interactive
  end

  test do
    assert_predicate bin/"lml", :executable?
  end
end
