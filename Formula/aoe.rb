class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.1/aoe-darwin-arm64.tar.gz"
      sha256 "190b8df3e5edb33d35aa971c748e34f71975e694493d93e5ae93effc403f6588"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.1/aoe-darwin-amd64.tar.gz"
      sha256 "2f1af0dfc246a8f6be86df316c7514e3cf610c3e46b2c40c8f9dd53e125c483c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.1/aoe-linux-arm64.tar.gz"
      sha256 "1f58139e0e149eaf46ce50101ee8e2da075b9a816f6d7771920fd15056f866cf"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.10.1/aoe-linux-amd64.tar.gz"
      sha256 "1853f28a0082e41b918c75ce89678bfededd6e94aa3acc6a83be056be562af3b"
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
