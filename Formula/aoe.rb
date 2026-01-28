class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.3/aoe-darwin-arm64.tar.gz"
      sha256 "d69611054ccd861039e89a7eb11e2092cc12c1858f174f16d05b517b22fed416"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.3/aoe-darwin-amd64.tar.gz"
      sha256 "43b8f504bf5ece849898777d92f0139941a0642505681b1475576cd7f81b7132"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.3/aoe-linux-arm64.tar.gz"
      sha256 "1ef51ac3cbbade869c9d7114b8e0d52a7ce30c2feb1db670dab89acfa15411e8"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.8.3/aoe-linux-amd64.tar.gz"
      sha256 "dfacf8cd242b73152d915336aec1a9dd2ac7318f1655b3422c282de008f9e769"
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
