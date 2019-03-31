class User1
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(friend, joke)
    friend.learn(joke)
  end

  def joke_by_id(id)
    @jokes.find {|joke| joke.id == id}
  end
end