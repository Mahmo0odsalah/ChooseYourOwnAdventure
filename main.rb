require_relative('player')
require_relative('get_input')

puts('...........')
# sleep(1)
system 'clear'
puts('Waaaaaa, Waaaaa, Waaaaa')
p = Player.new(GetInput.get_input("Congratulations, it's a .....", [{ name: :inclusion, extra: %w[boy girl] }]))
