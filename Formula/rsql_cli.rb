class RsqlCli < Formula
  desc "rsql is a CLI for CockroachDB, DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, Redshift, ScyllaDB, Snowflake, SQLite3 and SQL Server."
  homepage "https://theseus-rs.github.io/rsql/rsql_cli/"
  version "0.20.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.20.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "664e9815b9d543d996e889855df1f3ff24e1631e7d2d980e019bbdc779e8815e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.20.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "14d07f404da0f8b4662cec10b00c86cbbda08833689afa18e5a91115c7ddebce"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/rsql/releases/download/v0.20.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "3d6e9351a81d8c2cd3d42b2b11a31bfd0cd7716100444f2861855874fed94a26"
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "rsql" if OS.mac? && Hardware::CPU.arm?
    bin.install "rsql" if OS.mac? && Hardware::CPU.intel?
    bin.install "rsql" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
