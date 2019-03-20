class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(friend, joke)
    # Person telling joke puts joke in their jokes array
    self.learn(joke)
    # Friend updates their jokes array
    friend.learn(joke)
  end

  def joke_by_id(index)
    @jokes.select {|joke| joke.id == index}
  end

end
