class API  

  # def self.get_lists 

  # end  

   
  def self.get_films 
    url = "https://swapi.dev/api/films/" 
    uri = URI(url) 
    response = Net::HTTP.get(uri) 
    films_hash = JSON.parse(response) 

    array_of_films = films_hash["results"] 
    binding.pry 

  end 

   
  def self.get_characters 
    character_url = "https://swapi.dev/api/people/" 
  end 

   
end