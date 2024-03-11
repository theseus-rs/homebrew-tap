class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "02f461290710e0b85e272051b4fcd8ec913b5100d8ede10f1c73a71693f713ac"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "cb9ca8774d239e2a768adff412040c50f69f840f6af01901901e65633a0efe8f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f75f13adb872ad6b8d82bf06563eb8f1535e63772305ff99159c9d8b91467f6e"
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
