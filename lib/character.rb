class Character 
  attr_accessor :name, :birth_year, :home_planet, :films

  @@all = [] 

  def initialize
    @@all << self 
  end 

  def self.all 
    @@all 
  end 
  
  def self.find_by_name(name)
    self.all.find{|character| character.name == name}
  end
  
   

end