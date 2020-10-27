class Character 
  attr_accessor :name, :birth_year, :home_planet, :films

  @@all = [] 

  def initialize(name, film)
    @name = name 
    @@all << self 
    @films = []
    add_film(film)
  end 

  def self.all 
    @@all 
  end 
  
  def self.find_by_name(name)
    self.all.find{|character| character.name == name}
  end
  
  def add_film(film)
    # binding.pry
    film.characters << self
    @films << film 
  end
   

end