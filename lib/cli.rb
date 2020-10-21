class CLI 

  def start  
    puts "Hello! I am F1NDR, your personal Star Wars information finder.".colorize(:blue) 
    puts "" 
    puts "If you'd like to utilize my services, please type 'yes' or 'y'. If you'd like to exit this program, please hit any other key.".colorize(:yellow) 
    API.get_characters 
    user_input = gets.strip.downcase 

  end 


end