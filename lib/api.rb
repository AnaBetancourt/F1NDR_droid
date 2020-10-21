require 'pry' 

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
      # fim.characters = need to get an array of all the characters from the movie and return their names in a list of strings
       
      # characters_list = film_hash["characters"] 
      #   characters_list.each do |link| 
      #     API.make_character(link)
      #   end
        
        #won't parse link through iteration but will when individually passed in as argument....hmmm
     
    end

  end 

  
  # def self.make_character(link)
  #   url = link
  #   uri = URI(url) 
  #   response = Net::HTTP.get(uri) 
  #   character_hash = JSON.parse(response) 
    
  #   if !Character.all.include?(character_hash["name"])
  #     character = Character.new
  #     character.name = character_hash["name"]
  #     character.birth_year = character_hash["birth_year"]
  #   # character.home_planet = character_hash["homeworld"] <- returns a link to the home world's api
  #   # character.films = character_hash["films"] <- returns an array of links to film apis
  #   end
  # end 

   
end