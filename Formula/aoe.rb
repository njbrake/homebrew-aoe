class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.7.0/aoe-darwin-arm64.tar.gz"
      sha256 "f29c6d296448a6086c106ab771c31a22a4b7efdf9faa491ec8a6f9064971ce50"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.7.0/aoe-darwin-amd64.tar.gz"
      sha256 "0da4df8461aaabf04012fb824aa5e29206b76e5496c4efef6724c8bf83270190"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.7.0/aoe-linux-arm64.tar.gz"
      sha256 "b0e8b2c2ab7a1cae178f042fc09a09e2ce285c8022f172bd133d0629ec3d527e"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.7.0/aoe-linux-amd64.tar.gz"
      sha256 "cb6aaff31aa4463dd3d68389f7294823b82d528c3ad3b52d4bfc1a6a3bb2189a"
    end
  end

  depends_on "tmux"

  livecheck do
    url :stable
    strategy :github_latest
  end

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
