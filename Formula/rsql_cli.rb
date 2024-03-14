class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.3.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.3.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "c623253ff606a4e8a7fdb292f22f04e5364e1a938a7b46438952ce858d0b6ceb"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.3.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "a05ad64e1d7a6a1f45d61f0b9817b819392ea9bccc02854733b72543c1de114c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.3.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a281efcdc24eba67f5c6d42c7ef0230d006c4eb0fcd0223268669b2d04725b05"
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
