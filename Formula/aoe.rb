class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.3/aoe-darwin-arm64.tar.gz"
      sha256 "48511561c1cb0c809cc8dfdffb68ee0d184b3b5c5e08dcb374e8855e9c367cf7"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.3/aoe-darwin-amd64.tar.gz"
      sha256 "7c6ac3e8e7accebd480228615459d101653634b7ae331094b91c406cf638fb07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.3/aoe-linux-arm64.tar.gz"
      sha256 "c762d87a41d4d6ef59ced35aa125ed996ea69274738dc2d5fd66b98c6b2c1ace"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.4.3/aoe-linux-amd64.tar.gz"
      sha256 "edb5a67a911f42df5f9823234a8a6300abcf43e57928063fc33530ac77aa1533"
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
