class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.4.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "b78c16613ba6ecac64278a0fcbbfd6e56df07f8e2199082a247879729ba93d6f"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "2c6ce07a84782a88c6485a492eb57b35de223fbbbc3efacd164b8aaf1a32a8f5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "78858dd096cb6549fe437fe66f965d807a1df7386fd2b859f45710e07788e30a"
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
