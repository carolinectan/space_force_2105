class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(info)
    @name = info[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(personnel)
    @personnel << personnel
  end

  def recommend_personnel(ship)
    keys = []
    ship.requirements.each do |hash|
      keys << hash.keys
    end
    keys.flatten

    people = @personnel.find_all do |person|
      person.specialties == keys.flatten && person.experience > 5
    end
    people
  end
end
