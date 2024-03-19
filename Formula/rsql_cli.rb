class RsqlCli < Formula
  desc "rsql command line interface for PostgreSQL and SQLite3."
  version "0.5.2"
  on_macos do
    on_arm do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "abc73c6bc76e20aa16b24ceefd475fc474cf1073014ed012a095ee02b5700886"
    end
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "357fdcf8393249ff47d30f4d9a158c180088b30d97c2cac6b4789f17724c96ce"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/theseus-rs/rsql/releases/download/v0.5.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9ac37dff50f10cbf1df319e2d471ec82680f8a374b08f454b4eed3c4a34b40a5"
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
