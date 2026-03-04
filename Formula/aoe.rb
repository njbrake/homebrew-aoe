class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.3/aoe-darwin-arm64.tar.gz"
      sha256 "5f1f00e1cbb2dcc7c7fc4c866b326951bf4a168134b876368645e538a3f56361"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.3/aoe-darwin-amd64.tar.gz"
      sha256 "7e59b2d8b72aa2b48b8038ccfd2b1ed13243dfec485120abc360827aa37ddb94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.3/aoe-linux-arm64.tar.gz"
      sha256 "8ea5d846b60110ed78caec635f113c628b89c107e6603bbff21426cae4a57efb"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.13.3/aoe-linux-amd64.tar.gz"
      sha256 "93086e959d7e033983eacd43686858e2e0deda4dfb94e72d624796fb5e6af84d"
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
