require 'pry'  

class API   
  attr_accessor :characters 

  def self.get_films  
    url = "https://swapi.dev/api/films/"  
    uri = URI(url)  
    response = Net::HTTP.get(uri)  
    hash = JSON.parse(response)  
    @characters = []

    array_of_films = hash["results"]  
    array_of_films.each do |film_hash| 
      film = Film.new 
      film.title = film_hash["title"] 
      film.episode_id = film_hash["episode_id"] 
      film.opening_crawl = film_hash["opening_crawl"] 
      film.release_date = film_hash["release_date"] 
      # film.characters =  

      characters_list = film_hash["characters"]  
      characters_list.each do |link|  
        split_link = link.split("") 
        https = split_link.insert(4, "s") 
        new_link = https.join 
        API.make_character(new_link) 
      end  
    end 
  end  


  def self.make_character(link) 
    url = link 
    uri = URI(url)  
    response = Net::HTTP.get(uri)  
    character_hash = JSON.parse(response)  
    
    binding.pry
    
    if !Character.all.include?(character_hash["name"])
      character = Character.new 
      character.name = character_hash["name"] 
      character.birth_year = character_hash["birth_year"] 
      # character.home_planet = character_hash["homeworld"] <- returns a link to the home world's api 
      # character.films = character_hash["films"] <- returns an array of links to film apis 
      @characters << character.name 
    end
  end  
    

end 