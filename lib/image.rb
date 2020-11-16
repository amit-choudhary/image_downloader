# Haven't used open-uri because of the issues mentioned at https://janko.io/improving-open-uri/

require "down"

class Image
  # Not making destination dynamic to prevent writes to unwanted locations.
  DESTINATION_PATH = './'

  # Max size of 100MB to prevent attacks since the URLs are external and server might be too busy in downloading large files.
  MAX_SIZE = 100 * 1024 * 1024

  attr_reader :download_url

  def initialize(download_url)
    @download_url = download_url
  end

  def store
    begin
      p "Storing image from #{download_url}"
      Down.download(download_url, destination: DESTINATION_PATH)
    rescue Down::Error => exception
      p 'Unable to download'
    end
  end
end
