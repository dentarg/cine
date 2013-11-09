require 'net/http'

class FilmDnSe
  URL='http://film.dn.se/'

  def self.fetch(url, limit = 10)
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    uri = Addressable::URI.parse(url)
    cookie = { "Cookie" => "sessionid=#{ENV.fetch('sessionid')};" }

    request  = Net::HTTP::Get.new(uri.request_uri, cookie)
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(request)
    end

    case response
    when Net::HTTPSuccess then
      response.body
    when Net::HTTPRedirection then
      location = response['location']
      fetch(location, limit - 1)
    else
      response.value
    end
  end
end
