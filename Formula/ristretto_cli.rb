class RistrettoCli < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_cli/"
  version "0.19.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.19.1/ristretto_cli-aarch64-apple-darwin.tar.xz"
      sha256 "15af00e8c2cbb2318272006c5112b96d8488372c8ff8c7a9266f6ab34cea8a96"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.19.1/ristretto_cli-x86_64-apple-darwin.tar.xz"
      sha256 "f6ef9292c7bd216cde9f00543744b4aa7e4f327a068bc4a82ce9fe0d404b5bd5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.19.1/ristretto_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ccfacd6b6a2b404f677a4a2bbb7dfd01ce732aac643bcb51c6cac66ecfd44255"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.19.1/ristretto_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c80760119841c00679036bdee16b0a2bb4cca5e769971b221e764bf463816734"
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
    bin.install "java" if OS.mac? && Hardware::CPU.arm?
    bin.install "java" if OS.mac? && Hardware::CPU.intel?
    bin.install "java" if OS.linux? && Hardware::CPU.arm?
    bin.install "java" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
