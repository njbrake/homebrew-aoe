class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.2/aoe-darwin-arm64.tar.gz"
      sha256 "c46d417969ae4d7e4d469e888ec924fb7ef211e6e0e2aad66e816bbd03c2b55c"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.2/aoe-darwin-amd64.tar.gz"
      sha256 "55e5c229167b5144fa285fd61298d3f6db422516a3c08caeee828b7758d3e06f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.2/aoe-linux-arm64.tar.gz"
      sha256 "a186681b06243ad71051baf97a2b800c8aaf81585c8a27f41c71f374952c332c"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.2/aoe-linux-amd64.tar.gz"
      sha256 "b279a0bc2bc34188046601303a126664fd6c38e9fafc2591f976af4afecc7770"
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
