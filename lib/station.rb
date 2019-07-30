class Station

  attr_reader :name, :zone

  def initialize(name='', zone=0)
    @name = name
    @zone = zone
  end

end


# test = Station.new("Old Street", 1)
# puts test.name
# puts test.zone
