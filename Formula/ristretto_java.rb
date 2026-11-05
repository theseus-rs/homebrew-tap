class RistrettoJava < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_java/"
  version "0.35.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_java-aarch64-apple-darwin.tar.xz"
      sha256 "f8648e1343b79997acb93de38721c95a593518b9104e7547c0401e32e6f2649e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_java-x86_64-apple-darwin.tar.xz"
      sha256 "6174f9cd7227351050f1ee9feba704e7f5eec4dc8b42403bc302750a8f9c9cd6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_java-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f014f1e5ff4b59f58a5e8301e74ab69b66474710141163fb50ed65caad88542f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.35.0/ristretto_java-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c73edb03b892ebb1faddfe10ce45a64c085aface632fdf395fab31c5c0c02ee0"
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
