class RistrettoCli < Formula
  desc "A Java Virtual Machine (JVM) CLI."
  homepage "https://theseus-rs.github.io/ristretto/ristretto_cli/"
  version "0.13.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.13.1/ristretto_cli-aarch64-apple-darwin.tar.xz"
      sha256 "968feaf8ee2357c8676c4d50bc118d50e598d4851330340d1e096adf4c14f614"
    end
    if Hardware::CPU.intel?
      url "https://github.com/theseus-rs/ristretto/releases/download/v0.13.1/ristretto_cli-x86_64-apple-darwin.tar.xz"
      sha256 "d7e10a19cb9d405e26f993893fe4f857d6e1ac0fd61269d8aec59da870224037"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/theseus-rs/ristretto/releases/download/v0.13.1/ristretto_cli-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "129f770bf9ffd323261b44756b2b12c52273e137956cab6f5e59ab6897f64923"
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
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
