class Bearhunter < Formula
  desc "This package is about to remove Russian footprint from you codebase"
  homepage "https://github.com/aashvetsov/bearhunter"
  url "https://github.com/aashvetsov/bearhunter.git", tag: "0.1.0"

  depends_on xcode: ["13.2.1", :build]

  def install
    system "make", "build", "prefix=#{prefix}"
    bin.install ".build/universal/bearhunter" => "bearhunter"
    system "make", "cleanup", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/bearhunter", "--path ./"
  end

end
