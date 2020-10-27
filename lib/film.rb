class Film  
  attr_accessor :title, :episode_id, :opening_crawl, :release_date, :characters 

  @@all = [] 

  def initialize 
    @@all << self 
    @character_list = []
  end 

  def self.all 
    @@all 
  end 
  
  def self.find_by_title(film_title)
    self.all.select{|film| film.title == film_title}
  end
  
  def list_of_characters
    @character_list
  end

  
end 