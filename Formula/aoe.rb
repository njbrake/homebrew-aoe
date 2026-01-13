class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.3/aoe-darwin-arm64.tar.gz"
      sha256 "ccbde39bff345b4fef6290d83981253afe9cec6cb89bbd93a5f3839af8e07028"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.3/aoe-darwin-amd64.tar.gz"
      sha256 "181f41add6957b479b17e54e2faf3f6cc40ed06a354c019f6b8090922e91abec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.3/aoe-linux-arm64.tar.gz"
      sha256 "49e9a9fb4381afd23b068f101ddd98cab284b426634504b5d732cb2258d02256"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.3/aoe-linux-amd64.tar.gz"
      sha256 "b88ec948f17472f71a17cf4bd17dd827dd44d67a5b2b9aab97d4a49561a1e61b"
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
