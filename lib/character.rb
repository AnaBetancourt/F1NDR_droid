class Character 
  attr_accessor :name, :birth_year, :home_planet, :films 

  @@all = [] 

  def initialize(name) 
    @name = name 
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

   

end