class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.2/aoe-darwin-arm64.tar.gz"
      sha256 "6d0fcbb3c48504f00a0e5e8d16ab6df2636ccdd10e2a06b918cfcfee1663a2ab"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.2/aoe-darwin-amd64.tar.gz"
      sha256 "b9b8aa29e06126ef36df490b17fca4e55df23322bfea25422efa5f27db8ab1ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.2/aoe-linux-arm64.tar.gz"
      sha256 "cc6a17c046071deaeb17b5004bf6b0c1cd4d24adf26262dd57419fd541ae4d89"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.2/aoe-linux-amd64.tar.gz"
      sha256 "4936ca60aa2d3c11df2b34adb507b334edba09e8c3e7785bbdb598d9321e1d05"
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
