class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.1/aoe-darwin-arm64.tar.gz"
      sha256 "5e9dc40811aaf956b0f64f66a425ad61adcb1ba5b0317219e08fa49ec6a393ec"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.1/aoe-darwin-amd64.tar.gz"
      sha256 "03d36b86c1ebc3c78c52ddb3a97403508a79ce6944f86bc53f9e9cc42f0f8b1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.1/aoe-linux-arm64.tar.gz"
      sha256 "2024f1ef8d1395677a763b1a945a0e032bba4f05178f81496e86a686726e561f"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.1/aoe-linux-amd64.tar.gz"
      sha256 "bedad3dce92e82bf2dfc2ed69f3b48263f7e01a799e055c298af56c8d231c913"
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
