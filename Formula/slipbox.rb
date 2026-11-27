# slipbox's Homebrew formula (plan 14.3), made for one release by scripts/release.ts: its version, and each pack's
# address and SHA-256, written in. .github/workflows/homebrew.yml puts it in the tap once the release is published.
class Slipbox < Formula
  desc "Read, review and edit what your coding agent writes, in your terminal"
  homepage "https://github.com/remziduzagac/slipbox"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/remziduzagac/slipbox/releases/download/v0.6.0/slipbox-0.6.0-darwin-arm64.tar.gz"
    sha256 "3967aa9b06a856aad262821e19cf8daa94c44f88813fe5d35bd36de737947f87"
  end
  on_linux do
    on_arm do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.6.0/slipbox-0.6.0-linux-arm64.tar.gz"
      sha256 "79ff6f40dfa2628373a30236e4661855e62f6cf89605975e9c2a0738a06ee84e"
    end
    on_intel do
      url "https://github.com/remziduzagac/slipbox/releases/download/v0.6.0/slipbox-0.6.0-linux-x64.tar.gz"
      sha256 "5885f60e0780781df9c992be0f4f21fc4bfd023e65ed38d7339728dbbeed5ef2"
    end
  end

  def install
    bin.install "slipbox"
    doc.install "NOTICES.txt"
  end

  post_install_steps do
    run "slipbox", args: ["skill", "--auto"], base: :bin, print_stdout: true, must_succeed: false
  end

  def caveats
    <<~EOS
      Agent skill destinations and any refusals are reported during installation.
      If a user skill could not be installed, run: slipbox skill --auto
      HOMEBREW_SLIPBOX_NO_SKILL=1 skips automatic skill installation and refresh.
    EOS
  end

  test do
    assert_equal "slipbox #{version}", shell_output("#{bin}/slipbox --version").strip
  end
end
