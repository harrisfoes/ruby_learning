require 'json'
require 'io/console'

run = true
menu = true
play = false
rules = false

hp = 50
attack = 6
name = ""
        
        #col1       col2      col3         col4 
map = [["plains",   "town",   "bridge",    "plans"],   #row1
       ["plains",   "plains", "plains",    "oasis"],   #row2
       ["jungle",   "lake",   "mountain",  "plains"],  #row3
       ["mountain", "swamp",  "plains",    "lair"]]    #row4

y_len = map.length - 1
x_len = map[0].length - 1

start_loc = map[0][2]
current_loc = start_loc

biome = {
  plains: {
    e: true,
    d: "PLAINS"
  },
  town: {
    e: false,
    d: "TOWN"
  },
  bridge: {
    e: false,
    d: "BRIDGE"
  },
  oasis: {
    e: false,
    d: "OASIS"
  },
  jungle: {
    e: true,
    d: "JUNGLE"
  },
  lake: {
    e: false,
    d: "LAKE"
  },
  mountain: {
    e: true,
    d: "MOUNTAIN"
  },
  swamp: {
    e: true,
    d: "SWAMP"
  },
  lair: {
    e: true,
    d: "LAIR"
  }
}

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
end

def press_any_key()
    puts "Press any key..."
    STDIN.getch
end

def draw_line()
    puts "-------------"
end

while run

  while menu
   
    clear()
    draw_line()
    puts "1 NEW GAME "
    puts "2 LOAD GAME " if File.exists?("load.json")
    puts "3 RULES "
    puts "4 QUIT GAME "
    draw_line()

    choice = gets.chomp

    if choice == "1"

      print "Enter your name: "
      name = gets.chomp
      menu = false
      play = true

    elsif choice == "2"

      data = load() 
      name = data['name'] 
      hp = data['hp'].to_i
      attack = data['attack'].to_i

      puts "Game Loaded"
      puts "Your name is #{name}"
      press_any_key()

      menu = false
      play = true

    elsif choice == "3"

      puts "These are the rules"
      puts "Your name is #{name}"
      press_any_key()

    elsif choice == "4"

      puts "Exiting Tales of Marrok"
      exit

    end

  end

  while play

    save(name, hp, attack) #autosave

    clear()
    draw_line()
    puts "#{name}"
    puts "HP: #{hp}"
    puts "ATTACK: #{attack}"
    draw_line()

    puts "1 GO NORTH"
    puts "2 GO SOUTH"
    puts "3 GO EAST"
    puts "4 GO WEST"

    draw_line()
    puts "0 SAVE AND BACK TO MAIN MENU" 
    draw_line()
    dest = gets.chomp

    if dest == "1"
       
    elsif dest == "0"
      play = false
      menu = true
    end
  end

end

