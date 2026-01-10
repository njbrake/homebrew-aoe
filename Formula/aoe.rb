class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.9/aoe-darwin-arm64.tar.gz"
      sha256 "a50e8a84ccb6387e33523eedcc612283b84249447952b83cc85e2d920dfd7f19"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.9/aoe-darwin-amd64.tar.gz"
      sha256 "10872e996f60e88a518dfab8e305085757f8e71aa9bca0825ad011b81de55275"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.9/aoe-linux-arm64.tar.gz"
      sha256 "a263bc146d5f898220a64b206ac49dea68f5768c0c59cc132c2cd1e61dbaeb90"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.9/aoe-linux-amd64.tar.gz"
      sha256 "4e60765f7046e65b7a49ded4cec0c4e151450c547e196467261cca56be540713"
    end
  end

  depends_on "tmux"

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
