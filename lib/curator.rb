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

  def artists_with_multiple_photographs
    artist_names = []
    photographs_by_artist.each do |artist, photographs|
      if photographs.count > 1
        artist_names << artist.name
      end
    end
    artist_names
  end

  def photographs_taken_by_artist_from(country)
    photographs_from_country = []
    photographs_by_artist.each do |artist, photographs|
      photographs.each do |photograph|
      if artist.country == country
        photographs_from_country << photograph
      end
    end
    end
    photographs_from_country
  end

  def load_photographs(file_path)
    csv = CSV.read(file_path, headers: true, header_converters: :symbol)
    loaded_photos = csv.map do |row|
      @photographs << Photograph.new(row)
    end
  end
end
