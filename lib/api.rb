class API  

  # def self.get_lists 
  # end  

   
  def self.get_films 
    url = "https://swapi.dev/api/films/" 
    uri = URI(url) 
    response = Net::HTTP.get(uri) 
    hash = JSON.parse(response) 

    array_of_films = hash["results"] 
    
    
    array_of_films.each do |film_hash|
      binding.pry 
      film = Film.new
      film.title = film_hash["title"]
      film.episode_id = film_hash["episode_id"]
      film.opening_crawl = film_hash["opening_crawl"]
      film.release_date = film_hash["release_date"]
      # characters = film_hash["characters"] <- returns an array of links to character APIs
    end
      

  end 

   
  def self.get_characters 
    character_url = "https://swapi.dev/api/people/" 
  end 

   
end