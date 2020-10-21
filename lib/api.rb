class API  

  def self.get_films 
    url = "https://swapi.dev/api/films/" 
    uri = URI(url) 
    response = Net::HTTP.get(uri) 
    hash = JSON.parse(response) 

    array_of_films = hash["results"] 
    
    
    array_of_films.each do |film_hash|
      film = Film.new
      film.title = film_hash["title"]
      film.episode_id = film_hash["episode_id"]
      film.opening_crawl = film_hash["opening_crawl"]
      film.release_date = film_hash["release_date"]
      characters_list = film_hash["characters"] 
      
      # ^- returns an array of links to character APIs
    end

  end 

  
  def self.get_characters(url) 
    url = "https://swapi.dev/api/people/" 
    uri = URI(url) 
    response = Net::HTTP.get(uri) 
    hash = JSON.parse(response) 

    array_of_characters = hash["results"] 
    
    
    array_of_characters.each do |character_hash|
      
      character = Character.new
      character.name = character_hash["name"]
      character.birth_year = character_hash["birth_year"]
      # character.home_planet = character_hash["homeworld"] <- returns a link to the home world's api
      # character.films = character_hash["films"] <- returns an array of links to film apis
    end
  end 

   
end