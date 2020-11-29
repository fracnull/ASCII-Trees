class Forest
  def initialize(cols:, rows:)
    @columns = cols
    @rows = rows
    @inhabitants = []
    @soil = Array.new(@rows) { Array.new(@columns, " ") }
  end

  def place(object:, x:, y:)
    return if x < 0 or x >= @columns or
    y < 0 or y >= @rows

    object.x, object.y = [x, y]
    my_z_index = y * @columns + x

    i = 0
    placed = false
    while i < @inhabitants.length and !placed
      z_index = @inhabitants[i].y * @columns + @inhabitants[i].x
      if my_z_index < z_index
        @inhabitants.insert(i, object)
        placed = true
      end
      i += 1
    end
    @inhabitants.push object if !placed
  end

  def grow
    @inhabitants.each { |inhabitant| inhabitant.grow }
  end

  def to_s
    @inhabitants.each_with_index do |inhabitant|
      x0 = inhabitant.x
      y0 = inhabitant.y
      inhabitant.coordinates.each do |coor, char|
        x, y = coor
        if y0 + y > 0 and
           y0 + y < @rows and
           x0 + x > 0 and
           x0 + x < @columns
          @soil[y0 + y][x0 + x] = char
        end
      end
    end

    str = ""
    @soil.each { |row| str += row.join("") + "\n" }
    return str
  end
end
