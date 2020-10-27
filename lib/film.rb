class Film  
  attr_accessor :title, :episode_id, :opening_crawl, :release_date, :characters 

  @@all = [] 

  def initialize
    @@all << self
    @characters = []
  end 

  def self.all 
    @@all 
  end 
  
  def add_character(character)
    character.films = self unless character.films == self
    @characters << character unless @characters.include?(character)
  end

  
end 