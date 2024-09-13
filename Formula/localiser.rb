class Localiser < Formula
  desc "CLI tool for processing localisation (converts locale JSON files into JS objects"
  homepage "https://github.com/jayesh83/LocalePush"
  url "https://github.com/jayesh83/LocalePush/releases/download/v1.0.0/LocalePush-v1.0.0.jar"
  sha256 "85e10aae9cf0faa27999aa4bfed2529586641c5f9544190b199c589053a18385"
  version "v1.0.0"

  def install
    libexec.install "LocalePush-v1.0.0.jar"
    (bin/"localiser").write <<~EOS
      #!/bin/bash
      exec java -jar "#{libexec}/LocalePush-v1.0.0.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/localiser", "--version"
  end
end