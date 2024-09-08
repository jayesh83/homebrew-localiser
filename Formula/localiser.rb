class Localiser < Formula
  desc "CLI tool for processing localisation (converts locale JSON files into JS objects"
  homepage "https://github.com/jayesh83/LocalePush"
  url "https://github.com/jayesh83/LocalePush/releases/download/v0.0.1/LocalePush-0.0.1.jar"
  sha256 "cdd3612254fb36f913bc2d13cc24a27253743a7daefec9dd7713ccc2028c9e0c"
  version "v0.0.1"

  depends_on "openjdk"

  def install
    libexec.install "localiser.jar"
    (bin/"localiser").write <<~EOS
      #!/bin/bash
      exec java -jar "#{libexec}/localiser.jar" "$@"
    EOS
  end

  test do
    system "#{bin}/localiser", "--version"
  end
end