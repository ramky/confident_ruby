Place = Struct.new(:index, :name, :price) do
  def to_int
    index
  end
end

winners = [
  "Homestar",
  "King of Town",
  "Marzipan",
  "Strongbad"
]

first  = Place.new(0, :first, "Peasant's Quest Game")
second = Place.new(1, :second, "Limozeen Album")
third  = Place.new(2, :third, "Butter-da")

[first, second, third].each do |place|
  puts "In #{place.name} place, #{winners[place]}"
  puts "You win: #{place.price}"
end
