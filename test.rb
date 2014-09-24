require 'curses'

window = Window.new(7, 40, 7, 2)

def draw
  window.setpos(1, 10)
end

def test
  Curses.timeout = 0
  char = ''

  while char != 'q'
    Curses.clear()
    char = Curses.getch
    puts "#{char} was pressed"
  end

  puts "you have quit"

end

test
