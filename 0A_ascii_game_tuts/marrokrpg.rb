run = true
menu = true
play = false
rules = false

def save(name)
  data = {
    name: name,
  }
  File.open("load.txt","w") { |file| file.write(data) }
end

while run

  while menu
    
    puts "-------------"
    puts "1 NEW GAME "
    puts "2 SAVE GAME "
    puts "3 RULES "
    puts "4 QUIT GAME "
    puts "-------------"

    choice = gets.chomp

    if choice == "1"
      print "Enter your name: "
      name = gets.chomp
      menu = false
      play = true
    elsif choice == "2"
      if name == ""
        puts "You have not created a character yet"
      end

      save(name)

    elsif choice == "3"
      puts "These are the rules"
      # choice = ""
      # break
    elsif choice == "4"
      puts "Exiting Tales of Marrok"
      exit
    end

  end

  while play
    puts "Welcome to the game #{name}"
    dest = gets.chomp

    if dest == "0"
      play = false
      menu = true
    end
  end

end

