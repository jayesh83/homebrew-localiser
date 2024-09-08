class Localiser < Formula
  desc "CLI tool for processing localisation (converts locale JSON files into JS objects"
  homepage "https://github.com/jayesh83/LocalePush"
  url "https://github.com/jayesh83/LocalePush/releases/download/v0.0.1/LocalePush-0.0.1.jar"
  sha256 "de17bb566741207cae05322168c4625b17fdbbf29c6d77a5cf8f063c1985abc4"
  version "v0.0.1"

  depends_on "openjdk"

  def install
    libexec.install "LocalePush-0.0.1.jar"
    (bin/"localiser").write <<~EOS
      #!/bin/bash
      exec java -jar "#{libexec}/LocalePush-0.0.1.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/localiser", "--version"
  end
end