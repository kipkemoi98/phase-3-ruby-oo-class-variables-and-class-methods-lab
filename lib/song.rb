class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filesongs)
        filesongs_array = filesongs.split(' - ')
        song = Song.new(filesongs_array[1])
        song.artist = Artist.find_or_create_by_name(filesongs_array[0])
        song.artist.add_song(song)
        song
    end
    
    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        song = Song.new(artist.songs)
        song.artist = artist
        song.artist.name
       
    end
end