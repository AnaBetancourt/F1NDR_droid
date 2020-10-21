class Film  
  attr_accessor :title, :episode_id, :opening_crawl, :release_date, :characters 

  @@all = [] 

  def initialize(title) 
    @title = title 
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

   
end 