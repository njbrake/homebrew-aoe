class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.14.0/aoe-darwin-arm64.tar.gz"
      sha256 "93cbc14b03888c19fcb589e5f36309e6bf3d808ed64027e092e3866006af75ca"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.14.0/aoe-darwin-amd64.tar.gz"
      sha256 "2fdcd708758baadac7d16f820c55a6ac46399dd6d163386b0b247a9fb8001e96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.14.0/aoe-linux-arm64.tar.gz"
      sha256 "09d09538568612c3bc8bca629e7efd00520761ebdbaf774f168d091c3fcec77e"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.14.0/aoe-linux-amd64.tar.gz"
      sha256 "765546bd37c1d7d0b85a6c6283a93b8134a27d59ce3836c4180197841a6038c0"
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
