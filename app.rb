require 'date'
require 'sinatra/base'
require './film_dn_se'

class AppController < Sinatra::Base
  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  get '/url' do
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
