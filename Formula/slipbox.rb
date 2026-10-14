# slipbox's Homebrew formula (plan 14.3), made for one release by scripts/release.ts: its version, and each pack's
# address and SHA-256, written in. .github/workflows/homebrew.yml puts it in the tap once the release is published.
class Slipbox < Formula
  desc "Terminal companion for coding agents"
  homepage "https://github.com/remziduzagac/slipbox"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.3.0/slipbox-0.3.0-darwin-arm64.tar.gz"
      sha256 "3f731566d9abd2c1b01f1c585cfbff6cc95f0a870a870fcfb7d6844c1248c341"
    end
    on_intel do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.3.0/slipbox-0.3.0-darwin-x64.tar.gz"
      sha256 "f1447bbcb044ae47d0dd6495cd77fca45753aefac6122a592b10a0aac55fc395"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.3.0/slipbox-0.3.0-linux-arm64.tar.gz"
      sha256 "7dafdf2753da6eb24884c253db6791289ca7baa37850736b075b52d5a8b1e443"
    end
    on_intel do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.3.0/slipbox-0.3.0-linux-x64.tar.gz"
      sha256 "305804353dfc5ec057ac9d4a583c3c27c0402580731eff7c633dfd1ca5065b06"
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
