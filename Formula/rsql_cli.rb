class RsqlCli < Formula
  desc "rsql is a CLI for DuckDB, LibSQL, MariaDB, MySQL, PostgreSQL, SQLite3 and SQL Server."
  homepage "https://theseus-rs.github.io/rsql/rsql_cli/"
  version "0.13.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.8/rsql_cli-aarch64-apple-darwin.tar.xz"
      sha256 "9ddf1a46d6fd5c9e3caae80e715ad66be8db4121c2815daa08934db65553fbeb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.8/rsql_cli-x86_64-apple-darwin.tar.xz"
      sha256 "ac35d5354b8b3353661d453040dfe6870b4cb80203bb61d7ae49beb9b7cbafc7"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/rsql/releases/download/v0.13.8/rsql_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6699f5a2065ac000e35af35d77cd0a186bac438c52cd966acacf6f698804ad6c"
    end
  end
  license "Apache-2.0 OR MIT"
  
  depends_on "xz"
  depends_on "xz"

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}}

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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "rsql"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "rsql"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "rsql"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
