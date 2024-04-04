class RsqlCli < Formula
  desc "rsql is a command line interface for MariaDB, MySQL, PostgreSQL and SQLite3."
  version "0.9.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.9.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "c20440d971ee3c70c9bc48ad03af4bf5749611832052c6ff7ddf461756905689"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.9.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "b7e3f3c023619e3f630eafd2b208e637e79a476499910db2c3c356a3d615e2c3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.9.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ba8f1cfb9461136e33a1ad83384a4fa0a57e8a4d916913231731c938c6455a1e"
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
