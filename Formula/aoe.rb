class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.4/aoe-darwin-arm64.tar.gz"
      sha256 "6d7390a3c0e4cce95a7faa59f8a44d9c77d7e095ec2ad795109f449031f694fb"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.4/aoe-darwin-amd64.tar.gz"
      sha256 "cd5bc7757d439f0926f3beb6d7debcf228ca2ccaa13e42cf896dc41184c9b976"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.4/aoe-linux-arm64.tar.gz"
      sha256 "b2b9286b2f74a81820a2da2983dfd561bc327ec3e4514de03388bc97e7deeb12"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.3.4/aoe-linux-amd64.tar.gz"
      sha256 "c9523ea22c54b3704c6005fb98d35721f8fbcf0398b8cc0b16f875309be4f896"
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
