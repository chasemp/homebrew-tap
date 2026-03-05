class Spina < Formula
  desc "PDF to web-friendly EPUB, HTML, and PDF converter using ML extraction"
  homepage "https://github.com/chasemp/spina"
  url "https://github.com/chasemp/spina/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0b4268b73e28321469de134e5fe6cd0bcd3be709b2ae88614751e3dc95909aed"
  license "AGPL-3.0-only"

  depends_on "python@3.12"
  depends_on "pandoc"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec/"venv"

    system python, "-m", "venv", venv
    system "#{venv}/bin/pip", "install", "--no-cache-dir", "."

    # Create a wrapper script that uses the venv python
    (bin/"spina").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/spina" "$@"
    EOS
    chmod 0755, bin/"spina"
  end

  test do
    system bin/"spina", "--help"
  end
end
