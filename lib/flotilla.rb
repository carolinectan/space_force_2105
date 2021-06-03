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
    keys = keys.flatten

    ship_req = []
    ship.requirements.each do |hash|
      ship_req << hash.values
    end
    ship_req = ship_req.flatten

    num = ship_req.find do |number|
      (10 - number)
    end

    people = @personnel.find_all do |person|
      person.specialties == keys && person.experience >= num
    end
    people
  end

  def personnel_by_ship
    personnel_by_ship = Hash.new do |hash, key|
      hash[key] = []
    end

    @ships.select do |ship|
      personnel_by_ship[ship] << recommend_personnel(ship)

    end

    personnel_by_ship
    # returns nested array for value
  end
end
