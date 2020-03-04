require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    @curator = Curator.new
    @photo_1 = Photograph.new({
         id: "1",
         name: "Rue Mouffetard, Paris (Boy with Bottles)",
         artist_id: "1",
         year: "1954"
    })
    @photo_2 = Photograph.new({
         id: "2",
         name: "Moonrise, Hernandez",
         artist_id: "2",
         year: "1941"
    })
    @photo_3 = Photograph.new({
         id: "3",
         name: "Identical Twins, Roselle, New Jersey",
         artist_id: "3",
         year: "1967"
    })
    @photo_4 = Photograph.new({
         id: "4",
         name: "Monolith, The Face of Half Dome",
         artist_id: "3",
         year: "1927"
    })
    @artist_1 = Artist.new({
         id: "1",
         name: "Henri Cartier-Bresson",
         born: "1908",
         died: "2004",
         country: "France"
    })
    @artist_2 = Artist.new({
         id: "2",
         name: "Ansel Adams",
         born: "1902",
         died: "1984",
         country: "United States"
    })
    @artist_3 = Artist.new({
         id: "3",
         name: "Diane Arbus",
         born: "1923",
         died: "1971",
         country: "United States"
    })
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_attributes
    assert_equal [], @curator.photographs
    assert_equal [], @curator.artists
  end

  def test_add_photograph
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    assert_equal [@photo_1, @photo_2], @curator.photographs
  end

  def test_add_artist
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    assert_equal [@artist_1, @artist_2], @curator.artists
  end

  def test_find_artist_by_id
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    assert_equal @artist_1, @curator.find_artist_by_id("1")
  end

  def test_photographs_by_artist
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_artist(@artist_3)
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)
    expected = {
      @artist_1 => [@photo_1],
      @artist_2 => [@photo_2],
      @artist_3 => [@photo_3, @photo_4]
    }
    assert_equal expected, @curator.photographs_by_artist
  end
end
# pry(main)> curator.photographs_by_artist
# # => {
# #        #<Artist:0x00007fabc6a52340...> => [#<Photograph:0x00007fabc6933180...>],
# #        #<Artist:0x00007fabc6c20870...> => [#<Photograph:0x00007fabc6c28e58...>],
# #        #<Artist:0x00007fabc5ba0c70...> => [#<Photograph:0x00007fabc5bb9ef0...>, #<Photograph:0x00007fabc6b931f0...>]
# #      }
#
# pry(main)> curator.artists_with_multiple_photographs
# # => ["Diane Arbus"]
#
# pry(main)> curator.photographs_taken_by_artist_from("United States")
# # => [#<Photograph:0x00007fabc6c28e58...>, #<Photograph:0x00007fabc5bb9ef0...>, #<Photograph:0x00007fabc6b931f0...>
#
# pry(main)> curator.photographs_taken_by_artist_from("Argentina")
# # => []

# photographs_by_artist - This method will return a hash artists as keys, and an array of their photographs as values.
# artists_with_multiple_photographs - This method returns an Array of names of artists who have more than one photograph
# photographs_taken_by_artists_from(string) - This method takes a String representing a country. It returns an Array of Photographs that were taken by a photographer from that country.
