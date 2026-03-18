class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.0/aoe-darwin-arm64.tar.gz"
      sha256 "44276684b627f0e61dfa185b309021f425c98edc655197382ca88fb7d2c88ae1"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.0/aoe-darwin-amd64.tar.gz"
      sha256 "5ffa094e94928d52e8fdf9868b635103de5cfc629a2619256b79b86e3e58a2d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.0/aoe-linux-arm64.tar.gz"
      sha256 "c65f222d2ab5c2f5f5fe3fd5021dedce5e2e6c42cb6e56edab648b23d337c996"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.17.0/aoe-linux-amd64.tar.gz"
      sha256 "5607910296d7240c7b83adf594d350ebab9c49965d07813ca827f6e9e01b631a"
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
