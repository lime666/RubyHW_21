require 'time'

class Menu
  require_relative 'animal'
  require_relative 'cat'
  require_relative 'owl'

  COMMANDS = %w[eat rest rave wakeup pet bath wc voice help status age exit]

  def create_animal
    p 'Какое животное Вы бы хотели родить: cat или owl?'
    @animal_type = gets.chomp.downcase
    p 'Как бы Вы хотели назвать животину?'
    name = gets.chomp
    if @animal_type == 'cat'
      @animal = Cat.new(name)
      COMMANDS << %w[purr]
    elsif @animal_type == 'owl'
      @animal = Owl.new(name)
      COMMANDS << %w[hunt]
    else
      p 'Животные закончились.'
    end
    p 'Подождите немного пока животина родится.'
    sleep 5
    p "#{name} родился. Назад дороги нет."
    sleep 2
  end

  def start_to_play
    create_animal
    while true
      p 'Выберите действие: '
      p COMMANDS
      command = gets.chomp.downcase
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
      when 'status'
        @animal.status
      when 'age'
        @animal.age
      when 'voice'
        @animal.voice
      when 'purr'
        @animal.purr
      when 'hunt'
        @animal.hunt
      when 'exit'
        break
      else
        p 'Отдохни, хозяин. Ты устал и не понимаешь о чем говоришь.'
      end
    end
  end
end

Menu.new.start_to_play
