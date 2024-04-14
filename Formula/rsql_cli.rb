class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://github.com/theseus-rs/rsql"
  version "0.11.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.2/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "9fb23112e5c7bccff29bafed36f5f6a828e55db4082448ba8b80d5955b1b6ac2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.2/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "1e823f7dac45c2655d5a5ad6294f04c10b33b1ab3a60127dbc6368fd6c3d73e9"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.11.2/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "24c7ce3b93232cff1518a38c2452083a7dfe0d2b9094505cd8f4f734b0cac0d1"
    end
  end
  license "Apache-2.0 OR MIT"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "rsql"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "rsql"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "rsql"
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
