require 'json'
require 'io/console'

run = true
menu = true
play = false
rules = false

hp = 50
attack = 6
name = ""

def clear()
  system("cls") || system("clear")
end

def save(name, hp, attack)
  data = {
    name: name,
    hp: hp,
    attack: attack 
  }
  File.open("load.json","w") { |file| file.write(data.to_json) }
end

def load()
  file_content = File.read("load.json") 
  data = JSON.parse(file_content)

  name = data['name']
  hp = data['hp']
  attack = data['attack']

  puts "This data is loaded #{name} #{hp} #{attack}"
end

while run

  while menu
   
    clear()

    puts "-------------"
    puts "1 NEW GAME "
    puts "2 LOAD GAME "
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
      load()
      puts "Game Loaded"
      puts "Your name is #{name}"
      puts "Press any key..."
      STDIN.gets
    elsif choice == "3"
      puts "These are the rules"
      puts "Your name is #{name}"
      puts "Press any key..."
      STDIN.gets
    elsif choice == "4"
      puts "Exiting Tales of Marrok"
      exit
    end

  end

  while play

    save(name, hp, attack) #autosave

    puts "Welcome to the game #{name}"
    dest = gets.chomp

    if dest == "0"
      play = false
      menu = true
    end
  end

end

