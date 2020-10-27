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

      characters_list = film_hash["characters"]  
      characters_list.each do |link|
        split_link = link.split("") 
        https = split_link.insert(4, "s") 
        new_link = https.join 
        API.make_character(new_link, film) 
      end 
    end
    binding.pry
  end  


  def self.make_character(link, film) 
    url = link 
    uri = URI(url)  
    response = Net::HTTP.get(uri)  
    character_hash = JSON.parse(response)  

    
    if !Character.find_by_name(character_hash["name"])
      character = Character.new(character_hash["name"], film)
      character.birth_year = character_hash["birth_year"] 
      
      home_link = character_hash["homeworld"]
      split_link = home_link.split("") 
      https = split_link.insert(4, "s") 
      homeworld = https.join 
      API.get_homeworld(homeworld)
      character.home_planet = API.get_homeworld(homeworld)
      
    else 
      character = Character.find_by_name(character_hash["name"])
      character.add_film(film)
    end
  end  
  
  def self.get_homeworld(homeworld)
    url = homeworld 
    uri = URI(url)  
    response = Net::HTTP.get(uri)  
    homeworld_hash = JSON.parse(response)
    
    planet_name = homeworld_hash["name"]
    planet_name
  end

end 