class CLI 

  def start  
    puts "Hello! I am F1NDR, your personal Star Wars information finder.".colorize(:blue) 
    puts "" 
    API.get_films
    self.ask_for_input
  end 
  
  def ask_for_input
    puts "If you'd like to utilize my services, please type 'yes' or 'y'. If you'd like to exit this program, please hit any other key.".colorize(:yellow) 
    user_input = gets.strip.downcase 
    
    if user_input == "yes" || user_input == "y"
      puts "Allow me to display you a list of the films. One moment while I fetch them for you...".colorize(:blue)
      sleep(3)
      self.list_the_films
    end 
  end

  def list_the_films
    Film.all.each.with_index(1) do |film, index|
      puts "#{index}. ".colorize(:blue) + "#{film.title}".colorize(:yellow)
      sleep(1)
    end
  end
  
  
  
end