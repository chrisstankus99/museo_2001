require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'

class ArtistTest < Minitest::Test

  def setup
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    @artist = Artist.new(attributes)
  end

  def test_it_exists
    assert_instance_of Artist, @artist
  end

  def test_attributes
    assert_equal "2", @artist.id
    assert_equal "Ansel Adams", @artist.name
    assert_equal "1902", @artist.born
    assert_equal "1984", @artist.died
    assert_equal "United States", @artist.country
  end

  def test_age_of_death
    assert_equal
  end
end

# Use TDD to create a Photograph and an Artist class that respond to the following interaction pattern.
# For age_at_death, assume an artist was born and died on the same day.

# pry(main)> artist.age_at_death
# #=> 82
