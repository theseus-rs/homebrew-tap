class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.4.3"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.3/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "98878a68d3db75de67b8fc08b22d5de5c0e430b20fa2ed244cd617c88f575c01"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.3/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "41adcf2f45e96a54d5cbbea5d55e6a7ff9625d179016946e42ededea4cf1d3ec"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.3/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "133e9b32c4dc17d4007539e303626ad05a70c8880eaa27c01cd4e65d90de6d53"
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
