require_relative '../lib/image'

open(ARGV[0]) do |file|
  file.read.split("\n").each do |download_url|
    Image.new(download_url).store
  end
end
