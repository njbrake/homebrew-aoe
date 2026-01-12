class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.1.2/aoe-darwin-arm64.tar.gz"
      sha256 "adad5e2b2275b1331f087127e33ae83e61679ed1a2f404bce0a5d47461e49263"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.1.2/aoe-darwin-amd64.tar.gz"
      sha256 "ab120589a57051e77b108b5a8ccadc9eb7a90a0dd565faff6764365cfc5abdb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.1.2/aoe-linux-arm64.tar.gz"
      sha256 "8d2335bdb12084f8450714c83ff662bde22f05d971b312592f27eb3d9445bf6b"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.1.2/aoe-linux-amd64.tar.gz"
      sha256 "75532b5a9bfbd7e872f5911590f6379979c15a1d6dbb61163c0dce398fa6ffa1"
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
