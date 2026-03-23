class ClaudeUtils < Formula
  desc "CLI utilities for Claude Code"
  homepage "https://github.com/chasemp/claude-utils"
  url "https://github.com/chasemp/claude-utils/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "663c10c44c90183083df5e29879002dbb3f200c039b90ee149c4f63b7c63281e"
  license "AGPL-3.0-only"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec/"venv"

    system python, "-m", "venv", venv
    system "#{venv}/bin/pip", "install", "--no-cache-dir", "."

    (bin/"claude-sessions").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/claude-sessions" "$@"
    EOS
    chmod 0755, bin/"claude-sessions"
  end

  test do
    system bin/"claude-sessions", "--help"
  end
end
