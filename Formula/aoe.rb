class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.3/aoe-darwin-arm64.tar.gz"
      sha256 "2f79e908a4e09991dac1dfd03bfc34b5b20b08f923187fb91caad1731403c5ea"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.3/aoe-darwin-amd64.tar.gz"
      sha256 "c6b27138fdab5044fb4d589e654a4441ed7aa7115f87780c11714ca375464aee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.3/aoe-linux-arm64.tar.gz"
      sha256 "6c888f537a92f1221af6c9b69f471c77d733bda66fff1c95ea3a643df0582747"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.3/aoe-linux-amd64.tar.gz"
      sha256 "33e0aad77771a3163348704892434d8c17d1c04d64cc1f2e100a8c720fd1c434"
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
