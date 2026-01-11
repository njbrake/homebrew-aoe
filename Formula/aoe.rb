class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.0.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.11/aoe-darwin-arm64.tar.gz"
      sha256 "0420a81ea3dc83fcdc6c9afe0d36adffc3ed9bdbc1aa6f7828736a76852965b6"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.11/aoe-darwin-amd64.tar.gz"
      sha256 "3870b53206e253a160a5e510d65187799d73831a846b3ceea143456e958d918f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.11/aoe-linux-arm64.tar.gz"
      sha256 "6b811802014904423309d0333bb721ea25f8b2a6126f8892f156bb218b1f6d37"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.0.11/aoe-linux-amd64.tar.gz"
      sha256 "9eb18d42ef9cd969b9ae2543828ac32777bde573307899f9972c3096fbfa67cb"
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
