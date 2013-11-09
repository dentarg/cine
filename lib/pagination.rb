require 'cgi'

class Pagination
  def self.url(referrer, page)
    uri = URI(referrer)
    query = uri.query

    params_url = CGI::parse(query)['url'].first
    params_url = remove_query(params_url)
    uri.query  = "url=#{params_url}?p=#{page}"

    uri.to_s
  end

  def self.remove_query(url)
    uri = URI(url)
    uri.query = nil
    uri.to_s
  end
end
