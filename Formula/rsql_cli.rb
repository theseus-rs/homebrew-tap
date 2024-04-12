class RsqlCli < Formula
  desc "rsql is a command line interface for MariaDB, MySQL, PostgreSQL and SQLite3."
  version "0.11.0"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "b4404954e7dbb51fcd0f977c26a09b0b3d0bbdd1d7ad1a8db390f65ebba99972"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "660e8fda1c9d3701995d5af6a6c9359fac529278752741ce4f6e62756e69f3c3"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f6f8390ca80a8927c20a4408f3c259a36f4469f097654510b3968b0056690c17"
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
