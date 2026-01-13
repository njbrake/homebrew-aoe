class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.2/aoe-darwin-arm64.tar.gz"
      sha256 "2c7c84e19487cd5d3aa8403916aa974b8741c4e05903934fdb518268d4e3f0a2"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.2/aoe-darwin-amd64.tar.gz"
      sha256 "68967b13d389110262df245b2566ac293c85d10a9d800c14628044e3aecba234"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.2/aoe-linux-arm64.tar.gz"
      sha256 "3d928b83abfb9b6c1b829ff139a413a5ac5aa5956d5bad5e3d2e87d8b13dc47f"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.2/aoe-linux-amd64.tar.gz"
      sha256 "dee57cb8f3cac141ffa132271b3c29c75162a38ab9d6ddd376cb23aca6d4a6e5"
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
