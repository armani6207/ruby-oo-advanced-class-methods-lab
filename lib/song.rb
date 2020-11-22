require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    x = Song.new
    x.save
    x
  end

  def self.new_by_name(name)
    x = Song.new
    x.name= (name)
    x
  end

  def self.create_by_name(name)
    x = Song.new
    x.name= (name)
    x.save
    x
  end

  def self.find_by_name(name)
    self.all.find {|x| (x.name == name ?  x : false)}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
       self.create_by_name(name)
    else
       self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(file)
    artist = []
    name = []
    file = file.split
    x = file.find_index("-")
    file.each_with_index do |word, index|
      word.delete_suffix!(".mp3") if word.include?(".mp3")
       if index < x
        artist << word
       elsif index > x
        name << word
       end
      end
      #binding.pry
      artist = artist.join(" ")
      name = name.join(" ")
      song = self.new_by_name(name)
      song.artist_name=(artist)
      song
  end

  def self.create_from_filename(file)
    artist = []
    name = []
    file = file.split
    x = file.find_index("-")
    file.each_with_index do |word, index|
      word.delete_suffix!(".mp3") if word.include?(".mp3")
       if index < x
        artist << word
       elsif index > x
        name << word
       end
      end
      #binding.pry
      artist = artist.join(" ")
      name = name.join(" ")
      song = self.create_by_name(name)
      song.artist_name=(artist)
      song
  end

  def self.destroy_all
    self.all.clear
  end

end
