class OpenMic1
  attr_reader :location, :date, :performers

  def initialize(hash)
    @location = hash[:location]
    @date = hash[:date]
    @performers = []
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes?
    performers_jokes.uniq.length == performer_jokes.length ? false : true
  end

  def performers_jokes
    @performers.flat_map {|user| user.jokes}
  end
end
