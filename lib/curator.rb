class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id}
  end

  def photographs_by_artist
    artists_photographs = {}
    @artists.each do |artist|
      photos = @photographs.find_all do |photograph|
        photograph.artist_id == artist.id
      end
      artists_photographs[artist] = photos
    end
    artists_photographs
  end
end
