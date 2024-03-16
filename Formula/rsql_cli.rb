class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.4.2"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "a95653bf05b9f2d72afca0f0665dee4801d94bcda763921bad23c2324c1a0993"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "fd2853f6b241e5ec43e358069f83ec1571bc597c6c1f78e2a524df5eefc31e41"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.4.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "49829192979345360e7c75d31ed895e4c5d389379ce7638b395eb5c8b03ae718"
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
