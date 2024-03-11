class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.1.1"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "75715ab3c68bcc7f05f613350cb84330deacb0092c7dbe791eac4d9698855afb"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "d2a910ec36a9134a809434942a8fc4914368c2622a2d3d8a4d2d4db14b8ceb9a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.1.1/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "794f291d418fde9ccc7834ec5b1df7bf4a58626f5142fb5f06f5dede3c3e1441"
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
