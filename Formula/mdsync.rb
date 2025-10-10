class Mdsync < Formula
  desc "Sync between Google Docs, Confluence, and Markdown files"
  homepage "https://github.com/chasemp/mdsync"
  url "https://github.com/chasemp/mdsync/archive/refs/heads/main.zip"
  version "0.1.0"
  sha256 "b108b65232926f29f3c7e25cf03e11a4d87880ae62b50de64fe08c7655459c54"
  license "MIT"
  
  depends_on "python@3.11"
  
  def install
    # Install Python dependencies
    system "pip3", "install", "-r", "requirements.txt"
    
    # Install the script
    bin.install "mdsync.py" => "mdsync"
    
    # Make it executable
    chmod 0755, bin/"mdsync"
  end
  
  test do
    system "#{bin}/mdsync", "--help"
  end
end
