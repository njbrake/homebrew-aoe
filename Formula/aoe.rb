class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.12/aoe-darwin-arm64.tar.gz"
      sha256 "ec6fac26dc3d288c4876e9ef719a121b3471f4cb2fc595ba5eb194d945f33151"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.12/aoe-darwin-amd64.tar.gz"
      sha256 "b5b55643e6c6a8ddf2d72728a4af402e399cbfb76762c1348a72c3b10deeaa2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.12/aoe-linux-arm64.tar.gz"
      sha256 "ee4b40c6c9b175789d6244aed3b4fded1e61f4a2091730510b19d7ae922451c4"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.12/aoe-linux-amd64.tar.gz"
      sha256 "5853754239bf715aeaa8408db5ef66c13817b7f8994383bdc823e265f273fcb6"
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
