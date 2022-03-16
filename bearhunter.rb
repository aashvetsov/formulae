class Bearhunter < Formula
  desc "This package is about to remove Russian footprint from you codebase"
  homepage "https://github.com/aashvetsov/bearhunter"
  url "https://github.com/aashvetsov/bearhunter.git", tag: "0.1.0"

  depends_on :xcode => "13.2.1"
  depends_on "cocoapods"

  def install
    system "make", "build", "prefix=#{prefix}"
    bin.install ".build/universal/bearhuntercli" => "bearhuntercli"
    system "make", "cleanup", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/bearhuntercli", "--path ./"
  end

end
