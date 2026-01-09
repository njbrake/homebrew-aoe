class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.5/aoe-darwin-arm64.tar.gz"
      sha256 "a120977169d88dc00c266b3891e56dd2f0680d20b22fe519c337420411251df5"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.5/aoe-darwin-amd64.tar.gz"
      sha256 "fbb9b2ad0bb5598b12e4c426c4b906f2c56ba728bf5f1f20a7c28157888f1f44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.5/aoe-linux-arm64.tar.gz"
      sha256 "54048bd1b799062f94199c9710b5ef7553bcdeef3bccdd57ed6db58c28c5e68a"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.5/aoe-linux-amd64.tar.gz"
      sha256 "b70d63b5d44de8b9a3fe18914d9931b5f07165f9ae23ce1a23d1ec337e3255ef"
    end
  end

  depends_on "tmux"

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "aoe-darwin-arm64" => "aoe"
      else
        bin.install "aoe-darwin-amd64" => "aoe"
      end
    else
      if Hardware::CPU.arm?
        bin.install "aoe-linux-arm64" => "aoe"
      else
        bin.install "aoe-linux-amd64" => "aoe"
      end
    end
  end

  test do
    assert_match "session manager", shell_output("#{bin}/aoe --help")
  end
end
