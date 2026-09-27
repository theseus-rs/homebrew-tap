class RistrettoJava < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_java/"
  version "0.34.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_java-aarch64-apple-darwin.tar.xz"
      sha256 "90485015e22c9f1e7f9c9f7ea758f90f965833075f45765e3541418e637722bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_java-x86_64-apple-darwin.tar.xz"
      sha256 "28abea7087dd194b00026b6fadb076265f505ecdd2b36d3c94a851fbd1325d62"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_java-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "39497479ecc2e3c30ff476a43208743af7c5f372399efbbf59630eea16c0733a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.34.0/ristretto_java-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "16d4d72a0873e728e9ed4f44ca57bd17c063d43d7158e7b7314285f77468b6ce"
    end
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "java"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "java"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "java"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "java"
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
