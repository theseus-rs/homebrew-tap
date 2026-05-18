class RsqlCli < Formula
  desc "rsql is a CLI for CockroachDB, DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, Redshift, Snowflake, SQLite3 and SQL Server."
  homepage "https://theseus-rs.github.io/rsql/rsql_cli/"
  version "0.19.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.19.4/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "e13a4c7a1f0d22828ed09c9079f3c6cce60c8100fd865c09f77906edb678d972"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.19.4/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "330ecc955caf1bccb68e4352109f47af3d3d0bfc0aabc403039cc73c083cdb8b"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/rsql/releases/download/v0.19.4/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "d5b7c05cdba47059749668b52d049d3743a02bf8b8623160a4e14ac84d116462"
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
