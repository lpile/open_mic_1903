require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke_1'

class JokeTest1 < Minitest::Test
  def setup
    @joke = Joke1.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  def test_it_exists
    assert_instance_of Joke1, @joke
  end

  def test_it_has_attributes
    assert_equal 1, @joke.id
    assert_equal "Why did the strawberry cross the road?", @joke.setup
    assert_equal "Because his mother was in a jam.", @joke.punchline
  end
end
