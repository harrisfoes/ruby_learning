require 'json'
require 'io/console'

run = true
menu = true
play = false
rules = false
@traveling = true

@hp = 30 
@hp_max = 30
@attack = 6
@name = ""

BADDIES = ["goblin", "poring"]        

BADDY_DEETS = {
  goblin: {
    name: "Goblin",
    atk: 3,
    hp: 12,
    face: "<( o _;_;_, o)>",
    reward: "Potion",
    gold: 6 
  },
  poring: {
    name: "Poring",
    atk: 2,
    hp: 8,
    face: "( o _, o )",
    reward: "Jelly",
    gold: 4 
  }
}


        #col1       col2      col3         col4 
MAP = [["plains",   "town",   "bridge",    "plains"],   #row1
       ["plains",   "plains", "plains",    "oasis"],   #row2
       ["jungle",   "lake",   "mountain",  "plains"],  #row3
       ["mountain", "swamp",  "plains",    "lair"]]    #row4

y_len = MAP.length - 1
x_len = MAP[0].length - 1

start_loc = MAP[0][1]
current_loc = start_loc
@y = 0
@x = 1

BIOME = {
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

def save()
  data = {
    name: @name,
    hp:@hp,
    attack: @attack, 
    x: @x,
    y: @y
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
    puts "----------------------------"
end

def player_info()
    draw_line()
    puts "#{@name}"
    puts "HP: #{@hp}/#{@hp_max}"
    puts "ATTACK: #{@attack}"
    puts "YOU ARE IN THE #{BIOME[MAP[@y][@x].to_sym][:d]}"
    draw_line()
end

def battle()
  #battle, respawn from a list of possible baddies
  foe = BADDIES[rand(BADDIES.length)]
  foe_data = BADDY_DEETS[foe.to_sym]
  foe_hp = foe_data[:hp]
  foe_atk = foe_data[:atk]
  @attack_log = ""
  @foe_log = ""

  player_info()

  puts "You've encountered a #{foe}"
  puts "A battle commences!"

  def battle_log()
    if @attack_log.size() > 0 or @foe_log.size() > 0
      draw_line()
      puts @attack_log if @attack_log.size() > 0
      puts @foe_log if @foe_log.size() > 0
      draw_line()
    end
  end

  while @hp > 0 and foe_hp > 0
    #while there is still no winner
    
    puts "Defeat the #{foe}!"
    puts "#{BADDY_DEETS[foe.to_sym][:face]}"

    battle_log()

    puts "#{@name}'s HP: #{@hp}"
    puts "Enemy HP: #{foe_hp}"
    puts "Enemy ATK: #{foe_atk}"
    draw_line()
    puts "1 ATTACK"
    puts "2 USE POTION"
    puts "3 RUN AWAY"
    draw_line()

    choice = gets.chomp

    if choice == "1"
      dmg = rand(@attack)
      foe_hp -= dmg 
      @attack_log = "You attack the #{foe} for #{dmg} damage"
    elsif choice == "2"
      #potion logic
    elsif choice == "3"
      #run away logic
    end

    if foe_hp > 0
      foe_dmg = rand(foe_atk)
      @hp -= foe_dmg
      @foe_log = "The #{foe} attacks you for #{foe_dmg} damage"
    end

    clear()

  end

  battle_log()

  if @hp <= 0
    #lose scenario
    puts "GAME OVER"
    press_any_key()
    exit 
  elsif foe_hp <= 0
    #win scenario
    puts "You win!"
    #check if wins a potion
    puts "The #{foe} drops x gold"
    puts "The #{foe} drops a potion"
  end
  draw_line()
  press_any_key()
  clear()

  @traveling = true

end

while run

  while menu
   
    clear()
    puts "------ DUNGEON CREW --------"
    puts "~Tales of the Patikan Isles~"
    draw_line()
    puts "1 NEW GAME "
    puts "2 LOAD GAME " if File.exists?("load.json")
    puts "3 RULES "
    puts "4 QUIT GAME "
    draw_line()

    choice = gets.chomp

    if choice == "1"

      print "Enter your name: "
      @name = gets.chomp
      menu = false
      play = true

    elsif choice == "2"

      data = load() 
      @name = data['name'] 
      @hp = data['hp'].to_i
      @attack = data['attack'].to_i
      @x = data['x'].to_i
      @y = data['y'].to_i

      puts "Game Loaded"
      puts "Your name is #{@name}"
      press_any_key()

      menu = false
      play = true

    elsif choice == "3"

      puts "These are the rules"
      puts "Your name is #{@name}"
      press_any_key()

    elsif choice == "4"

      puts "Exiting Tales of the Patikan"
      exit

    end

  end

  while play

    save() #autosave

    clear()

    if BIOME[MAP[@y][@x].to_sym][:e] #if map can spawn enemy
      if rand(100) < 30
        @traveling = false
        menu = false

        battle()

      end
    end

    if @traveling 
      player_info()
      puts "1 GO NORTH" if @y > 0
      puts "2 GO SOUTH" if @y < y_len
      puts "3 GO EAST"  if @x < x_len
      puts "4 GO WEST"  if @x > 0
      # puts "Coords #{x} #{y}"
    end

    draw_line()
    puts "0 SAVE AND BACK TO MAIN MENU" 
    draw_line()
    dest = gets.chomp

    if dest == "1"
      @y -= 1 if @y > 0 
    elsif dest == "2"
      @y += 1 if @y < y_len
    elsif dest == "3"
      @x += 1 if @x < x_len
    elsif dest == "4"
      @x -= 1 if @x > 0
    elsif dest == "0"
      save() #autosave
      play = false
      menu = true
    end
  end

end

