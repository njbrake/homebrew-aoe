class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.0/aoe-darwin-arm64.tar.gz"
      sha256 "e1afba70a95e4a3c2ff965967e2c15660b02cf6ba8ca9b34be2a9af7b76cc970"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.0/aoe-darwin-amd64.tar.gz"
      sha256 "b012661bd7eac20692909bce8749b89f56a5e94df5a031a2fa9926e6ed6fa3fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.0/aoe-linux-arm64.tar.gz"
      sha256 "d19c82872be2bc844d83b6bdfab947a79f69108e6bc1be20ac52622fc21e07ad"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.18.0/aoe-linux-amd64.tar.gz"
      sha256 "2aacf8c2f6b76673a637e9ccc4d2de7aeaf1fe9fbd191fbf71a6efb90e5575f8"
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
