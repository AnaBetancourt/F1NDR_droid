class CLI  
  attr_accessor :number 

  def start   
    puts "Hello! I am F1NDR, your personal Star Wars information finder. Allow me to gather all the information needed to assist you. This will take approximately".colorize(:light_blue) + " one minute".colorize(:red) + ", I apologize...".colorize(:light_blue)
    puts ""  
    API.get_films 
    self.ask_if_service_is_needed 
  end  


  def ask_if_service_is_needed 
    puts "If you'd like to utilize my services, please type".colorize(:light_blue) + " 'yes'".colorize(:light_green) + " or".colorize(:light_blue) + " 'y'".colorize(:light_green) + ". If you'd like to exit this program, please hit any other key.".colorize(:light_blue)  
    user_input = gets.strip.downcase  

    if user_input == "yes" || user_input == "y" 
      self.characters_or_films?

    else  
      puts "Goodbye!".colorize(:light_blue) 
    end  
  end 
  
  
  def characters_or_films?
    puts "Would you like to see a list of the films or a list of the characters? For films, please type".colorize(:light_blue) + " 'films'".colorize(:light_green) + ". For characters, please type".colorize(:light_blue) + " 'characters'".colorize(:light_green) + ".".colorize(:light_blue)
    user_input = gets.strip.downcase 
    
    if user_input == "films"
      puts "Allow me to display you a list of the films. One moment while I fetch them for you...".colorize(:light_blue) 
      sleep(3) 
      self.list_the_films
      
    elsif user_input == "characters"
      puts "Allow me to display you a list of the characters. One moment while I fetch them for you...".colorize(:light_blue) 
      sleep(3) 
      self.list_the_charaters
      
    else 
      puts "I'm terribly sorry, you have not entered a valid word. Allow me to take you back to the beginning of the selection protocol.".colorize(:light_blue)
      sleep(1)
      self.characters_or_films?
    end  
  end
  

  def list_the_films 
    Film.all.each.with_index(1) do |film, index| 
      puts "#{index}. ".colorize(:blue) + "#{film.title}".colorize(:yellow) 
      sleep(1) 
    end 
    self.ask_to_display_more_info
  end 
  
  
  def list_the_charaters
    Character.all.each do |character| 
      puts "#{character.name}".colorize(:yellow) 
      sleep(0.25)
    end
    self.ask_to_display_more_info
  end
  
  
  def ask_to_display_more_info
    puts ""
    puts "Would you like to learn more information about any character? Please type".colorize(:light_blue) + " 'y'".colorize(:light_green) + " or".colorize(:light_blue) + " 'yes'".colorize(:light_green) + " to learn more and".colorize(:light_blue) + " 'n'".colorize(:light_green) + "or".colorize(:light_blue) + " 'no'".colorize(:light_green) + " if not.".colorize(:light_blue)
    user_input = gets.strip.downcase
    
    if user_input == "no" || user_input == "n"
      
    
    elsif user_input == "yes" || user_input == "y"
      self.display_info_characters
      
    end
  end
  
  def display_info_characters
    puts "Please type the name of the character you'd like more information about.".colorize(:light_blue)
    character_name = gets.strip.downcase
    puts "Searching for character...".colorize(:light_blue)
    
    if !Character.find_by_name(character_name)
      puts "You have not entered a valid name. Please try again.".colorize(:light_blue)
      self.display_info_characters
      
    elsif Character.find_by_name(character_name)
      character = Character.find_by_name(character_name)
      self.display_details_character(character)
    end
  end
  
  
  def display_details_character(character) 
    puts "Name: #{character.name}".colorize(:yellow) 
    sleep(1) 
    puts "Birth Year: #{character.birth_year}".colorize(:yellow) 
    sleep(1) 
    puts "Home Planet: #{character.home_planet}".colorize(:yellow) 
    sleep(1) 
    puts "Films: ".colorize(:yellow)
    character.films.each do |film|
      puts "#{film.title}"
      sleep(0.25)
    end
  end
  

  def display_more_info_films
    puts "" 
    puts "Would you like further information about any of these films?".colorize(:light_blue) 
    puts "Again, please provide your answer in the form of".colorize(:light_blue) + " 'yes'".colorize(:light_green) + " or".colorize(:light_blue) + " 'y'".colorize(:light_green) + " to proceed, and any other key to leave this program.".colorize(:light_blue) 
    user_input = gets.strip.downcase 
     
    if user_input == "yes" || user_input == "y" 
      puts "Which film number would you like the details of?".colorize(:light_blue)
      number = gets.strip.to_i - 1  
      @number = number 

      if !self.valid?(self.number) 
        sleep(1)
        puts "I am terribly sorry, you have entered an invalid number. Allow me to bring you back to the beginning of my selection protocol.".colorize(:light_blue) 
        puts "" 
        self.display_more_info_films 

      else  
        self.display_details_film(self.number) 
        self.again?
      end 
    end 
  end 


  def valid?(num) 
    num.between?(0, 5) 
  end 


  def display_details_film(selected_film) 
    film = Film.all[selected_film] 
    puts "Title: #{film.title}".colorize(:yellow) 
    sleep(1) 
    puts "Episode ID: #{film.episode_id}".colorize(:yellow) 
    sleep(1) 
    puts "Release Date: #{film.release_date}".colorize(:yellow) 
    sleep(1) 
    puts "Opening Crawl: #{film.opening_crawl}".colorize(:yellow) 
    puts ""
    # sleep(1)
    # puts "Characters: ".colorize(:yellow)
    # sleep(0.25)
    # film.characters.each do |character|
    #   puts "#{character.name}".colorize(:yellow)
    #   sleep(0.75)
    # end
  end 
  
  def again?
    puts "" 
    puts "Would you like information on another film? The answer prompts remain the same;".colorize(:light_blue) + " 'yes'".colorize(:light_green) + " or".colorize(:light_blue) + " 'y'".colorize(:light_green) + " to proceed, and any other key to leave this program.".colorize(:light_blue) 
    user_input = gets.strip.downcase 
         
    if user_input == "yes" || user_input == "y" 
      self.display_info_again 

    else  
      puts "Glad to have been of service, goodbye!".colorize(:light_blue) 
    end 
  end
   

  def display_info_again 
    Film.all.each.with_index(1) do |film, index| 
      puts "#{index}. ".colorize(:blue) + "#{film.title}".colorize(:yellow) 
      sleep(1) 
    end 
    puts "Which film would you like information about now? Your previous selection was film number #{self.number + 1}.".colorize(:light_blue)
    new_selection = gets.strip.to_i - 1 
    
    if self.valid?(new_selection)
      @number = new_selection
    end
    
    if !self.valid?(new_selection) 
      sleep(1)
      puts "I am terribly sorry, you have entered an invalid number. Allow me to bring you back to the beginning of my secondary selection protocol.".colorize(:light_blue) 
      puts "" 
      self.display_info_again
    
    else  
        self.display_details(new_selection) 
        self.again?
    end
  end 



end 