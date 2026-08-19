class RistrettoJava < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_java/"
  version "0.33.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_java-aarch64-apple-darwin.tar.xz"
      sha256 "629789d178dd67a0a1653966588302ae5e059d98a14163df35b6f1abea034b5f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_java-x86_64-apple-darwin.tar.xz"
      sha256 "59b15c887fe66f21774fff1cb5cb13f7e2a9fd8fb112f006a23c9171ff2bc4d4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_java-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3052639774089fa4368fb4d08ecd6ff1e84e97a2bafe75ccade294ec34b7bc38"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.33.0/ristretto_java-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "61b32460e038fccc36c50789e00a9ae9549a414be0ac91ccd9bc04734fc12e6d"
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
