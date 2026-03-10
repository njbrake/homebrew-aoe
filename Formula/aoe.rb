class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.0/aoe-darwin-arm64.tar.gz"
      sha256 "bed8bc93ee97d0be4422e8693002fe8e011717c13c87ee4fae462a59b3f157dc"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.0/aoe-darwin-amd64.tar.gz"
      sha256 "fbd9bfc2fee9e151f1b708292f8af0205c2ab98ac80575a7838d93fafa29e89f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.0/aoe-linux-arm64.tar.gz"
      sha256 "04f402bef3e8f0b1468a0ff74e3f092798ccacb1ea557f98dbb1f905dd94100b"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.15.0/aoe-linux-amd64.tar.gz"
      sha256 "fdfe31dde57e9bbbe56baa390d1eb6f9846a52fb45e1c445f68d6b8b2ceb6d90"
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
