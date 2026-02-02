class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.0/aoe-darwin-arm64.tar.gz"
      sha256 "aba10238f9327d6016d225d86138d68de75fa3e97a8bfdbf79cf6ba33dbc00db"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.0/aoe-darwin-amd64.tar.gz"
      sha256 "13c2ffb996bc198ffcc69d0c19df0c1ad65903b77431d0ff1f34a2d346b44394"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.0/aoe-linux-arm64.tar.gz"
      sha256 "087ce5480ab83beb696b1cb45fe344492b21d28b2e51220b13f9a14aef4dbc6f"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.11.0/aoe-linux-amd64.tar.gz"
      sha256 "941d6d5da3fb82a04e6daee14f4f992974cbb7e025c8742799ff0507e594654d"
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
