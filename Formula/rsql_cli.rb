class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://theseus-rs.github.io/rsql/rsql_cli/"
  version "0.13.12"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.12/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "37519e70723a26589ab6c9eec01467ff30a2c4e15545ba3145360be5ebda85df"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.12/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "3a824dc6ca4073574b1f22cff627b4a07bdd4f962d4e9b5a42e2ffbb68f0d021"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/rsql/releases/download/v0.13.12/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "70aad6af511e0573a27015d70558e91ce8178de5e9585e37937d1fc2928c0be8"
  end
  license any_of: ["Apache-2.0", "MIT"]

  depends_on "xz"
  depends_on "xz"

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
