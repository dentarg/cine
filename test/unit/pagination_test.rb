require 'minitest/autorun'

$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'pagination'

class TestPagination < MiniTest::Unit::TestCase
  def test_pagination_without_page
    referrer = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Komedi'
    page     = '2'

    url = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Komedi?p=2'

    assert_equal url, Pagination.url(referrer, page)
  end

  def test_pagination_with_page
    referrer = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Komedi?p=2'
    page     = '3'

    url = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Komedi?p=3'

    assert_equal url, Pagination.url(referrer, page)
  end

  def test_remove_query
    url_with_query    = 'http://film.dn.se/genre/Komedi?p=3'
    url_without_query = 'http://film.dn.se/genre/Komedi'

    assert_equal url_without_query, Pagination.remove_query(url_with_query)
  end
end
