class Tree
  attr_accessor :x, :y

  def initialize
    @height = 0
    @levels = []
  end

  def grow
    case @height
    when 0
      @levels.push "|"
    when 1
      @levels[0] += "|"
      @levels.push "/\\"
    when 2
      @levels.insert(1, "//\\\\")
    else
      prev_leaf_count = @levels[1].length / 2
      leaf_count = prev_leaf_count + rand(0..1)
      level = ("/" * leaf_count) + ("\\" * leaf_count)
      @levels.insert(1, level)
    end
    @height += 1
  end

  def coordinates
    coor = {}
    @levels.each_with_index do |level, y|
      x0 = -level.length / 2 + 1
      level.each_char.with_index do |char, x|
        coor[[x0 + x, -y]] = char
      end
    end
    return coor
  end

  def to_s
    str = ""
    @levels.reverse.each do |level|
      padding = @height - level.size / 2
      str += " " * padding + level + "\n"
    end
    return str
  end
end
