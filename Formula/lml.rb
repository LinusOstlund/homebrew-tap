class Lml < Formula
  desc "macOS menu bar app for wrapping selected text in XML tags"
  homepage "https://github.com/LinusOstlund/linus-markup-language"
  url "https://github.com/LinusOstlund/linus-markup-language/releases/download/v0.1.0/LML-v0.1.0-arm64.tar.gz"
  sha256 "a50146941f235dcc1a730250ba1dbf012d4705ce5b80f4732226f716985c2760"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "LML" => "lml"
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
