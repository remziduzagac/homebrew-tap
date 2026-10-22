# slipbox's Homebrew formula (plan 14.3), made for one release by scripts/release.ts: its version, and each pack's
# address and SHA-256, written in. .github/workflows/homebrew.yml puts it in the tap once the release is published.
class Slipbox < Formula
  desc "Terminal companion for coding agents"
  homepage "https://github.com/remziduzagac/slipbox"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/remziduzagac/slipbox/releases/download/v0.5.0/slipbox-0.5.0-darwin-arm64.tar.gz"
    sha256 "4756f164af14ba306fa287630a97c1e3472eb80d97da589b187c0bc9c5af63ee"
  end
  on_linux do
    on_arm do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.5.0/slipbox-0.5.0-linux-arm64.tar.gz"
      sha256 "4d6b10986f90e97ac90ffd8a987427f67eb1b35f3b95ed4abeff5c6ba1909533"
    end
    on_intel do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.5.0/slipbox-0.5.0-linux-x64.tar.gz"
      sha256 "34c34ec16987343ca63cec4bda42ccd378df1eb80e7adb1861abe29245654c05"
    end
  end

  def install
    bin.install "slipbox"
    doc.install "NOTICES.txt"
  end

  test do
    assert_equal "slipbox #{version}", shell_output("#{bin}/slipbox --version").strip
  end
end
