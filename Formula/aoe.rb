class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.6/aoe-darwin-arm64.tar.gz"
      sha256 "32e82d83ec5d325621b8a2a702930a70fc91a4404b5733b9dc98d0965a7104f5"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.6/aoe-darwin-amd64.tar.gz"
      sha256 "40243a728d25b0d9ba7713792b20b71c4394e46c036547a800990edce40b5fb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.6/aoe-linux-arm64.tar.gz"
      sha256 "97dc0b2cd5fd89fea7092d71a2be977da193a2cfc17a98826948300831428055"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.5.6/aoe-linux-amd64.tar.gz"
      sha256 "1ecdca8f21d7f427af8ca2de6e38235dbb58423b4aa3cc77b6ba7df9432130a6"
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
