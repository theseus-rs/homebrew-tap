class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "6e803b08ea032e2009b3fbab5bc1e662a2e91a527ef6ed1f2cd5d18bcce3bcff"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "12d1496b873fc0f78d6907c98d824126da19fd7269ccb1bf1a84c24bbc5d6715"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f6a6b93e57db671b0c6dee947728a72f885c21f9e0321c0b5367c9e3036d4788"
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
