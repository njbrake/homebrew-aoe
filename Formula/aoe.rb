class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.1/aoe-darwin-arm64.tar.gz"
      sha256 "4a6d6e5a43b2ca9bf539bc2e9bf950ebe054b783e181bab06523639c56f39540"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.1/aoe-darwin-amd64.tar.gz"
      sha256 "19e792b227c3c3c860bbf86fd23b853b6d02ba74f9762ba34d9e77f1be8adcab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.1/aoe-linux-arm64.tar.gz"
      sha256 "81bec2601907f0c6c50f8a9d053615d6794c5e820dabb265744babeaa862bcc3"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.16.1/aoe-linux-amd64.tar.gz"
      sha256 "ce75237e007b254e19e664e80e02e72e8530a86a37797965a491073d7e4d8284"
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
