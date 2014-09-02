def Point(*args)
  case args.first
  when Integer then Point.new(*args)
  when String then Point.new(*args.first.split(':').map(&:to_i))
  when -> (arg) { arg.respond_to?(:to_point) }
    args.first.to_point
  when -> (arg) { arg.respond_to?(:to_ary) }
    Point.new(*args.first.to_ary)
  else
    raise TypeError, "cannot convert #{args.inspect} to Point"
  end
end

Point = Struct.new(:x, :y) do
  def inspect
    "#{x}:#{y}"
  end

  def to_point
    self
  end
end

Pair = Struct.new(:a, :b) do
  def to_ary
    [a, b]
  end
end

class Flag
  def initialize(x, y, flag_color)
    @x, @y, @flag_color = x, y, flag_color
  end

  def to_point
    Point.new(@x, @y)
  end
end

Point([5,7]) # => 5:7
Point(Pair.new(23, 32)) # => 23:32
Point(Flag.new(42, 24, :red)) # => 42:24

# Any client object can now define an explicit to_point conversion method
# By defining an idempotent conversion function like Point(), we can keep our
# public protocols flexible and convenient.
