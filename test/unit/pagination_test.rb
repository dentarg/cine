require 'minitest/autorun'

$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')

require 'pagination'

class TestPagination < MiniTest::Unit::TestCase
  def test_pagination_without_page
    referrer = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Dokumentär'
    page     = '2'

    url = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Dokumentär?p=2'

    assert_equal url, Pagination.url(referrer, page)
  end

  def test_pagination_with_page
    referrer = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Dokumentär?p=2'
    page     = '3'

    url = 'http://0.0.0.0:4567/url?url=http://film.dn.se/genre/Dokumentär?p=3'

    assert_equal url, Pagination.url(referrer, page)
  end

  def test_remove_query
    with_query = 'http://film.dn.se/genre/Dokumentär?p=3'
    no_query   = 'http://film.dn.se/genre/Dokumentär'

    assert_equal no_query, Pagination.remove_query(with_query)
  end
end
