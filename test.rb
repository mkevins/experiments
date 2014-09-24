require 'curses'

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
