require_relative 'animal'
require 'time'

class Menu

  COMMANDS = ['eat', 'rest', 'rave', 'wakeup', 'pet', 'bath', 'wc', 'voice', 'help', 'age', 'repeat', 'exit']

def create_animal
  puts "Как бы Вы хотели назвать животину?"
  name = gets.chomp
	@animal = Animal.new(name)
	puts "Подождите немного пока животина родится."
  sleep 5
  puts "#{name} родился. Назад дороги нет."
  sleep 2
end
  
def start_to_play
  create_animal
  while true 
  	command = command
  	case command
  	  when 'eat'
  	  	@animal.eat
  	  when 'rest'
  	  	@animal.rest
  	  when 'rave'
  	  	@animal.rave
  	  when 'wakeup'
  	  	@animal.wakeup
  	  when 'pet'
  	  	@animal.pet
  	  when 'bath'
  	  	@animal.bath
  	  when 'wc'
  	  	@animal.wc
  	  when 'help'
  	  	@animal.help
  	  when 'age'
      	@animal.show_age
      when 'repeat'
        @animal.repeat
  	  when 'exit'
  	  	break
  	  else
  	  	puts "Отдохни, хозяин. Ты устал и не понимаешь о чем говоришь."
  	  end
  	end
end

def command
  puts "Выберите действие: "
  puts COMMANDS
  command = gets.chomp.downcase
end

end

Menu.new.start_to_play