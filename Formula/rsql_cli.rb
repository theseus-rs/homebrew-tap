class RsqlCli < Formula
  desc "rsql is a CLI for CockroachDB, DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, Redshift, Snowflake, SQLite3 and SQL Server."
  homepage "https://theseus-rs.github.io/rsql/rsql_cli/"
  version "0.19.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.19.0/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "6c39eb4c87c9b264049a67b983d2656035d4d2b9087b33b5cfe9ed60d4268308"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.19.0/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "bd1de6cb8423942982fe10c60dd3a2d63f8ff26afb3ae2e017e7bc30e7857c26"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/rsql/releases/download/v0.19.0/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "9f14f9798dd7db32bf2c994f81be3d437e551e581829db4d9ee273226ee61be2"
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
