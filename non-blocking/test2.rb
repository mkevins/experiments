require "curses"
include Curses

init_screen
start_color
noecho

def draw_menu(menu, active_index=nil)
  4.times do |i|
    menu.setpos(i + 1, 1)
    menu.attrset(i == active_index ? A_STANDOUT : A_NORMAL)
    menu.addstr "item_#{i}"
  end
end

def draw_corners(menu)
  corners = %w{ ┏ ┗ ┓ ┛ }
  p menu.maxy #weirdness here!
  p menu.maxx
  [0, menu.maxy].product[0, menu.maxx].each do |y, x|
    #menu.setpos(y, x)
    #menu.addstr corners.shift
    #menu.addstr "t"

  end
end

def draw_info(menu, text)
  menu.setpos(1, 10)
  menu.attrset(A_NORMAL)
  menu.addstr text
end

def draw_time(menu)
  menu.setpos(2, 10)
  menu.attrset(A_NORMAL)
  menu.addstr Time.now.to_s
end

position = 0

menu = Window.new(7,40,7,2)
menu.box('┃', '━')
# menu.box('\\', '/')
menu.timeout = 0
draw_menu(menu, position)
while true
  ch = menu.getch
  case ch
  when 'w'
    draw_info menu, 'move up  '
    position -= 1
  when 's'
    draw_info menu, 'move down'
    position += 1
  when 'x'
    exit
  end
  position = 3 if position < 0
  position = 0 if position > 3
  draw_corners(menu)
  draw_menu(menu, position)
  draw_time(menu)
end
