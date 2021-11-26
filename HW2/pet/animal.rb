require_relative 'menu_animal'
require 'time'

class Animal

  attr_accessor :name


def initialize name
  @name = name
  @asleep = false
  @stuffInBelly = 10
  @stuffInIntestine = 0
  @lives = 10
  @energy = 10
  @birthTime = Time.new

end

def eat
  if @stuffInBelly <= 5 && @energy <= 5
    sleep 2
    puts "Спасибо, было очень вкусно, хотя я хз чем ты меня накормил."
    puts "Теперь хочу тусить."
    @energy += 2
    @stuffInBelly += 3
    @stuffInIntestine += 2
  else 
    puts "Спасибо, я не голоден."
  end
end

def rest
  puts "Вы укладываете животину спать."
  @asleep = true
  @energy += 3
  time_to_pass
end

def rave
  puts "Вы играете с #{@name}."
  @energy -= 2
  if @energy <= 6
    puts "Жизнь меня к такому не готовила, хозяин."
  end
  time_to_pass
end

def wakeup
  @asleep = false
  p "За что, хозяин?"
  p "Ну, раз ты меня рабудил..Чем займемя, милашка?"
end

def pet
  puts "Вы чешите #{@name} пузико."
  @energy -= 1
  sleep 2
  p "Спасибушки, хозяин. Я бы тоже хотел тебя почесать =)"
  time_to_pass
end

def bath
  puts "#{@name} купется."
  @energy -= 1
  time_to_pass
end


def wc
  if @stuffInIntestine >= 7
    puts "Жизнь обрела краски."
    @stuffInIntestine = 0
  else
    puts "Чуть позже, пожалуйста."
  end
end

def voice
  p "Во время линьки у некоторых птиц утрачивается способность к полету. "\
  "Так, например, утки при этом не могут летать 20-35 суток, "\
  "лебеди – почти 1,5 месяца."
end

def help
  puts "eat - накормить"
  puts "rest - положить спать"
  puts "rave - поиграть"
  puts "repeat - повторить действие"
  puts "wakeup - разбудить"
  puts "pet - учить"
  puts "bath - купаться"
  puts "voice - животина что-то поведает"
  puts "wc - опорожнить кишечник"
  puts "help - помощь"
  puts "exit - выйти из игры"
end

def age
  pet_age
end

def repeat
#  command. { |i| 1.times do i end }
end

private

def hungry?
  @stuffInBelly <= 3
  puts "Зачем я живу? Даже покормить некому..."
end

def time_to_pass
  if @stuffInBelly > 0
    @stuffInBelly -= 1
    @stuffInIntestine +=1
  elsif @asleep
    @asleep = false
    @stuffInBelly -= 1
  end
end

def want_to_sleep
  if (@asleep == false) & (@energy <= 2)
    puts "Где упал, там и кровать."
  end
end

def death
  if (@stuffInBelly == 0) || (@energy == 0)
  	@lives -= 1
  elsif (@stuffInBelly == 2)  || (@energy == 2)
  	puts "Смерть идет по пятам. Знать бы что нас ждет впереди..."
  elsif @stuffInBelly > 10 
    puts "#{@name} уже не с нами. Готовьте пирожки."
  end
end


def pet_age
  age = Time.now - @birthTime
end

def repeat
  rand_act = [method(:wantToSleep), method(:boring?), method(:hungry?)]
  rand_act.sample.map {|r| r.call}
end


end
