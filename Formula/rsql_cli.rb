class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.5.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "8492083184fe9904acfb8775890154004862dc7553583ad6012df433cf87fe9d"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "7ab6898761929f75301b278d18d7f1c5babce235ae99a2ea5acf1b0e9338c5e5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "359dd543c53a24fddd4d169f6b543d8a125ad22e956024e804e91fad09476887"
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
