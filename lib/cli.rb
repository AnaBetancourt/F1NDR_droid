class CLI 

  def start  
    puts "Hello! I am F1NDR, your personal Star Wars information finder.".colorize(:blue) 
    puts "" 
    self.ask_for_input
  end 
  
  def ask_for_input
    puts "If you'd like to utilize my services, please type 'yes' or 'y'. If you'd like to exit this program, please hit any other key.".colorize(:yellow) 
    user_input = gets.strip.downcase 
    
    if user_input == "yes" || user_input == "y"
      self.list_films
    end 
  end

  def list_films
    puts "here is your list"
  end
end