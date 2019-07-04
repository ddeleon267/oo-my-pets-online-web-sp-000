class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    # @cats = []
    # @dogs = [] # don't do this
  end

  def cats # have to do it this way
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs # have to do it this way
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name) # have to do it this way
    Cat.new(name, self)
  end

  def buy_dog(name) # have to do it this way
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|

      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    # could do self.cats + self.dogs
    self.cats.concat(dogs).each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def say_species
    "I am a #{self.species}."
  end
end
