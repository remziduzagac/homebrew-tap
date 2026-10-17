# slipbox's Homebrew formula (plan 14.3), made for one release by scripts/release.ts: its version, and each pack's
# address and SHA-256, written in. .github/workflows/homebrew.yml puts it in the tap once the release is published.
class Slipbox < Formula
  desc "Terminal companion for coding agents"
  homepage "https://github.com/remziduzagac/slipbox"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/remziduzagac/slipbox/releases/download/v0.4.0/slipbox-0.4.0-darwin-arm64.tar.gz"
    sha256 "c666c65180c8021738a3e167a8d3693ea5da4437471477ef601e024c5837247e"
  end
  on_linux do
    on_arm do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.4.0/slipbox-0.4.0-linux-arm64.tar.gz"
      sha256 "b89cf9239f19cbada56ec37869e9639a47f78f5937bb85a37d2865a5a64ba036"
    end
    on_intel do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.4.0/slipbox-0.4.0-linux-x64.tar.gz"
      sha256 "d0f47c539e3210362af4cda272172f95592316a09e57c794d9db4b00b4827972"
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
