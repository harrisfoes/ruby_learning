require 'json'
require 'io/console'

run = true
menu = true
play = false
rules = false
@traveling = true

hp = 50
attack = 6
name = ""

BADDIES = ["goblin", "poring"]        

BADDY_DEETS = {
  goblin: {
    name: "Goblin",
    atk: 3,
    hp: 12,
    reward: "Potion",
    gold: 6 
  },
  poring: {
    name: "Poring",
    atk: 2,
    hp: 8,
    reward: "Jelly",
    gold: 4 
  }
}


        #col1       col2      col3         col4 
map = [["plains",   "town",   "bridge",    "plains"],   #row1
       ["plains",   "plains", "plains",    "oasis"],   #row2
       ["jungle",   "lake",   "mountain",  "plains"],  #row3
       ["mountain", "swamp",  "plains",    "lair"]]    #row4

y_len = map.length - 1
x_len = map[0].length - 1

start_loc = map[0][1]
current_loc = start_loc
y = 0
x = 1

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

def save(name, hp, attack, x, y)
  data = {
    name: name,
    hp: hp,
    attack: attack, 
    x: x,
    y: y
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

def battle()
  #battle, respawn from a list of possible baddies
  foe = BADDIES[rand(BADDIES.length)]
  draw_line()
  puts "You've encountered a #{foe}"
  puts "A battle commences!"
  draw_line()

  foe_hp = BADDY_DEETS[foe.to_sym][:hp]
  foe_atk = BADDY_DEETS[foe.to_sym][:atk]
  puts "Enemy HP: #{foe_hp}"
  puts "Enemy ATK: #{foe_atk}"

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
      x = data['x'].to_i
      y = data['y'].to_i

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

    save(name, hp, attack, x, y) #autosave

    clear()
    draw_line()


    puts "#{name}"
    puts "HP: #{hp}"
    puts "ATTACK: #{attack}"
    puts "YOU ARE IN THE #{biome[map[y][x].to_sym][:d]}"
    draw_line()

    puts "1 GO NORTH" if y > 0
    puts "2 GO SOUTH" if y < y_len
    puts "3 GO EAST"  if x < x_len
    puts "4 GO WEST"  if x > 0
    # puts "Coords #{x} #{y}"

    if biome[map[y][x].to_sym][:e] #
      puts "this place can spawn baddies"
      if rand(100) < 30
        puts "a baddie has spawned!"
        @traveling = false
        menu = false

        battle()

        @traveling = true
      end
    end

    draw_line()
    puts "0 SAVE AND BACK TO MAIN MENU" 
    draw_line()
    dest = gets.chomp

    if dest == "1"
      y -= 1 if y > 0 
    elsif dest == "2"
      y += 1 if y < y_len
    elsif dest == "3"
      x += 1 if x < x_len
    elsif dest == "4"
      x -= 1 if x > 0
    elsif dest == "0"
      save(name, hp, attack, x, y) #autosave
      play = false
      menu = true
    end
  end

end

