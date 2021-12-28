require 'time'
require 'to_html_gem'
require 'bundler'
Bundler.setup

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
      p 'Можно только или котика, или сову.'
      exit
    end
    p 'Подождите немного пока животина родится.'
    sleep 5
    p "#{name} родился. Назад дороги нет."
    sleep 2
    html
  end

  def start_to_play
    create_animal
    Html.new.open_html

    while true
      p 'Выберите действие: '
      p COMMANDS
      command = gets.chomp.downcase
      case command
      when 'eat'
        @animal.eat
        html
      when 'rest'
        @animal.rest
        html
      when 'rave'
        @animal.rave
        html
      when 'wakeup'
        @animal.wakeup
        html
      when 'pet'
        @animal.pet
        html
      when 'bath'
        @animal.bath
        html
      when 'wc'
        @animal.wc
        html
      when 'help'
        @animal.help
      when 'age'
        @animal.age
        html
      when 'voice'
        @animal.voice
        html
      when 'purr'
        @animal.purr
        html
      when 'hunt'
        @animal.hunt
        html
      when 'exit'
        break
      else
        p 'Отдохни, хозяин. Ты устал и не понимаешь о чем говоришь.'
        html
      end
    end
  end
end

def html(html_file = 'index.html')
  content = "
    <p>Animal type: #{@animal_type}</p>"
  Html.new.to_html(content, true, html_file)
end

Menu.new.start_to_play
