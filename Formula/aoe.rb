class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.9.0/aoe-darwin-arm64.tar.gz"
      sha256 "4cc51296537763c4d42004e3d1d297f4efa4a647a33afd58eeb927cb660b39ab"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.9.0/aoe-darwin-amd64.tar.gz"
      sha256 "20d043abb2c338d0d5800a30ee3f2c03c45f4f860886c2ecf3d137c2e44bb8b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.9.0/aoe-linux-arm64.tar.gz"
      sha256 "b022ccabf013da32e51b477b4975cb36388068ca3503d02170c8737b2b5e05ba"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.9.0/aoe-linux-amd64.tar.gz"
      sha256 "b46dd15850b327d7142b5f1f335008fd375c56ca9fb1d7abb2ce949ab0fc8e2b"
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
