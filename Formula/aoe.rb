class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.4/aoe-darwin-arm64.tar.gz"
      sha256 "7d3302b1db0feb0701636a676fee9c5178e58b0681a02d94ad6e26023cd507e9"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.4/aoe-darwin-amd64.tar.gz"
      sha256 "bafb64a8d3f3e698c86cb104240a8aefdc84e677ae3054aa11391912b3f7b4e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.4/aoe-linux-arm64.tar.gz"
      sha256 "add6065e1374dadad40aaa6a80032dc49ecb1f0c2b7d5759084bd5302524b5ba"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.4/aoe-linux-amd64.tar.gz"
      sha256 "e9b2dd41ea986d17ed4f9cdfca05665dcf7de05afa319e7dacaf87a3b80342a5"
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
