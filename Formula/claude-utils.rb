class ClaudeUtils < Formula
  desc "CLI utilities for Claude Code"
  homepage "https://github.com/chasemp/claude-utils"
  url "https://github.com/chasemp/claude-utils/releases/download/v0.3.0/claude-utils-0.3.0-release.tar.gz"
  sha256 "49d404597245b4acba15fc36fd5126899f7d4f5b03372439cc56bc68b4b172fe"
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

    (bin/"claude-components").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/claude-components" "$@"
    EOS
    chmod 0755, bin/"claude-components"

    (share/"claude-utils").install "shell/claude-utils.zsh"
  end

  def caveats
    <<~EOS
      To enable shell integration (interactive session resume), add to your .zshrc:
        source "#{opt_share}/claude-utils/claude-utils.zsh"
    EOS
  end

  test do
    system bin/"claude-sessions", "--help"
    system bin/"claude-components", "--help"
  end
end
