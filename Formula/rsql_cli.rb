class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.4.4"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.4/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "e6536171e22919088a8a9d5c8fed458e9dba942ab2569d8abf22e2852b45b9c5"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.4/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "6c5fabc1cd5733d8d7b302950163bc75deac2004c0dc0a7589035ffb76761ff4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.4/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c66cdab4b74c0907653911499e38895c96391510d8ef41fc717936d4bbac3fe8"
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
