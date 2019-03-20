require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require 'pry'

class JokeTest < Minitest::Test
  # set up variables for test units
  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  # test if the Joke class exist
  def test_it_exist
    assert_instance_of Joke, @joke
  end

  # test if class attributes pass
  def test_it_has_attributes
    assert_equal 1, @joke.id
    assert_equal "Why did the strawberry cross the road?", @joke.setup
    assert_equal "Because his mother was in a jam.", @joke.punchline
  end
end
