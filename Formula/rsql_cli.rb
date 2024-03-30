class RsqlCli < Formula
  desc "rsql is a command line interface for MariaDB, MySQL, PostgreSQL and SQLite3."
  version "0.8.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.8.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "1d0ae95dfd43e69ad1d565d5e84eea42de99752fa0a8367a4933d58f7428ee21"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.8.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "8e0a63dbdf9d15ac948d970df761a4291d1f64948e91fa557fff2c269300f005"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.8.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5b238d6ce4cd4263da1098afd07329405ec77b3800eb0a801d0a0e59648e83e7"
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
