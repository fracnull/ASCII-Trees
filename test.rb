require_relative "tree.rb"
require_relative "forest.rb"

WIDTH = 60
HEIGHT = 60

forest = Forest.new(cols: WIDTH, rows: HEIGHT)

100.times { |i| forest.place object: Tree.new, x: rand(0..WIDTH), y: rand(0..HEIGHT) }

10.times do
  forest.grow
  puts forest
  sleep 1
  system "clear"
end
