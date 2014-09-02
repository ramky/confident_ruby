module Graphics
  # module_function does 2 things
  # 1. marks all methods as private - avoids clutter
  # 2. makes the method available as singleton methods on the module -
  # making is possible to access the conversion function without
  # including Conversions viz. Conversions.Point(1,2)
  module Conversions
     module_function

     def Point(*args)
       case args.first
       when Point then args.first
       when Array then Point.new(*args.first)
       when Integer then Point.new(*args)
       when String then Point.new(*args.first.split(':').map(&:to_i))
       else
         raise TypeError, "Cannot convert #{args.inspect} to Point"
       end
     end

     Point = Struct.new(:x, :y) do
       def inspect
         "#{x}:#{y}"
       end
     end
  end
end

include Graphics::Conversions

Point(Point.new(2,3)) # => 2:3
Point([9,7]) # => 9:7
Point(3,5) # => 3:5
Point('8:10') # => 8:10
