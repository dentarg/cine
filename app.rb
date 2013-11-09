require 'date'
require 'sinatra/base'

$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'pagination'
require './film_dn_se'

class AppController < Sinatra::Base
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  get '/url' do
    if params.has_key?('p')
      url = Pagination.url(request.referrer, params['p'])
      redirect url
    end
    url = params[:url]
    url = FilmDnSe::URL if url.to_s.empty?
    body FilmDnSe.fetch(url)
  end

  get '/*' do
    path  = params[:splat].first
    path += "?q=#{params['q']}" if params.has_key?('q')
    redirect "/url?url=#{FilmDnSe::URL}#{path}"
  end
end
