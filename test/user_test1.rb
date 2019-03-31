require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke_1'
require './lib/user_1'

class UserTest1 < Minitest::Test
  def setup
    @joke_1 = Joke1.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke1.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @sal = User1.new("Sal")
    @ali = User1.new("Ali")
  end

  def test_it_exists
    assert_instance_of User1, @sal
  end

  def test_it_has_attributes
    assert_equal "Sal", @sal.name
    assert_equal [], @sal.jokes
  end

  def test_if_user_learns_spells
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)

    assert_equal [@joke_1, @joke_2], @sal.jokes
  end

  def test_if_user_can_tell_joke_to_other
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)

    assert_equal [@joke_1, @joke_2], @ali.jokes
    assert_equal @joke_1, @ali.joke_by_id(1)
    assert_equal @joke_2, @ali.joke_by_id(2)
  end
end
