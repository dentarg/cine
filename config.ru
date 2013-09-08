$stdout.sync = true
$stderr.sync = true

map '/' do
  require 'rack/rewrite'
  use Rack::Rewrite do
    r301 %r{/static(.*)}, 'http://film.dn.se/static$1'
    r301 %r{/media(.*)},  'http://film.dn.se/media$1'
  end

  map '/' do
    require './app'
    run AppController
  end
end
