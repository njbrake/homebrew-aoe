class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.1/aoe-darwin-arm64.tar.gz"
      sha256 "0e478558288da3978f6d14be5318fc0a1d2dc45097d5a5a86bf4d53fb1ecdfc3"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.1/aoe-darwin-amd64.tar.gz"
      sha256 "eb8cfa8df8fcb3147142103fa30be4dc45b7b8d6d03ac0a69384aa076b160157"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.1/aoe-linux-arm64.tar.gz"
      sha256 "adf61d393c02740e6dd7213acaa607c9879bdf24b66b4dcfe39157ccf1e4da6f"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.1/aoe-linux-amd64.tar.gz"
      sha256 "0f441b1625ec90a11db093a9945f58083fb57ea8b2b4c28ff61878ac17a72612"
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
