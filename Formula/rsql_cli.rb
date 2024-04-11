class RsqlCli < Formula
  desc "rsql is a command line interface for MariaDB, MySQL, PostgreSQL and SQLite3."
  version "0.10.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.10.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "311fc719a7b468448aa17bc0517992beb9b0827e2cb862c7197d81fc5078ec9d"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.10.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "21a42121d46a22079618d85f9e91e15743cbfdc60a0609479a4629ddcb9df8c1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.10.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "37501319217866ff8f3e75fd1ea832908fa27c018d5568b0141ce0e8bb067502"
    end
  end
  license "Apache-2.0 OR MIT"

  def install
    on_macos do
      on_arm do
        bin.install "rsql"
      end
    end
    on_macos do
      on_intel do
        bin.install "rsql"
      end
    end
    on_linux do
      on_intel do
        bin.install "rsql"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
