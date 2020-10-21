class Film  
  attr_accessor :title, :episode_id, :opening_crawl, :release_date, :characters 

  @@all = [] 

  def initialize 
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

   
end 