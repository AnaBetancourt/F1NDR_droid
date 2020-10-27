class CLI  
  attr_accessor :number 

  def start   
    puts "Hello! I am F1NDR, your personal Star Wars information finder. Allow me to gather all the information needed to assist you, this will take just a moment...".colorize(:light_blue) 
    puts ""  
    API.get_films 
    self.ask_if_service_is_needed 
  end  


  def ask_if_service_is_needed 
    puts "If you'd like to utilize my services, please type".colorize(:light_blue) + " 'yes'".colorize(:light_green) + " or".colorize(:light_blue) + " 'y'".colorize(:light_green) + ". If you'd like to exit this program, please hit any other key.".colorize(:light_blue)  
    user_input = gets.strip.downcase  

    if user_input == "yes" || user_input == "y" 
      puts "Allow me to display you a list of the films. One moment while I fetch them for you...".colorize(:light_blue) 
      sleep(3) 
      self.list_the_films 

    else  
      puts "Goodbye!".colorize(:light_blue) 
    end  
  end 


  def list_the_films 
    Film.all.each.with_index(1) do |film, index| 
      puts "#{index}. ".colorize(:blue) + "#{film.title}".colorize(:yellow) 
      sleep(1) 
    end 
    self.ask_to_display_more_info 
  end 
   

  def ask_to_display_more_info 
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
        self.ask_to_display_more_info 

      else  
        self.display_details(self.number) 
        self.again?
      end 
    end 
  end 


  def valid?(num) 
    num.between?(0, 5) 
  end 


  def display_details(selected_film) 
    film = Film.all[selected_film] 
    # binding.pry
    puts "Title: #{film.title}".colorize(:yellow) 
    sleep(1) 
    puts "Episode ID: #{film.episode_id}".colorize(:yellow) 
    sleep(1) 
    puts "Release Date: #{film.release_date}".colorize(:yellow) 
    sleep(1) 
    puts "Opening Crawl: #{film.opening_crawl}".colorize(:yellow) 
    sleep(1)
    puts "Characters: ".colorize(:yellow)
    sleep(0.25)
    film.characters.each do |character|
      puts "#{character.name}"
      sleep(0.25)
    end
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