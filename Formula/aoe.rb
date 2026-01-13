class Aoe < Formula
  desc "Terminal session manager for AI coding agents"
  homepage "https://github.com/njbrake/agent-of-empires"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.1/aoe-darwin-arm64.tar.gz"
      sha256 "cd96eb7e153b0b997af4dccc6ca5ebfa0894430e507c05478981a50349637bf2"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.1/aoe-darwin-amd64.tar.gz"
      sha256 "d9227dc0b6f47c5d956f7c8ef9d3e4e8663ebff80361988776c815f501c90f8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.1/aoe-linux-arm64.tar.gz"
      sha256 "a2949676a28e5bc0e851a7778115cdc97ae0f23d1f0bbc48d24fe75e00a31ad9"
    end
    on_intel do
      url "https://github.com/njbrake/agent-of-empires/releases/download/v0.2.1/aoe-linux-amd64.tar.gz"
      sha256 "d42651ad0f97a8640f4b743ca27ec7ec8ca10b04e08a34992cb0524e92150fed"
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
