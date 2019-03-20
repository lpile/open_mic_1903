require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/joke'
require './lib/user'
require 'pry'

class UserTest < Minitest::Test
  # set up variables for test unit
  def setup
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  # test if User class exist
  def test_it_exist
    assert_instance_of User, @sal
  end

  # test if User attributes pass
  def test_it
    assert_equal "Sal", @sal.name
    assert_equal [], @sal.jokes
  end

  # test if user learns the joke
  def test_user_class_to_learn_joke
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)

    assert_equal [@joke_1, @joke_2], @sal.jokes
  end

  # test if one user can tell a joke to another user
  def test_user_to_tell_joke_to_other_user
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)

    assert_equal [@joke_1, @joke_2], @sal.jokes
    assert_equal [@joke_1, @joke_2], @ali.jokes
  end

  # test checking the joke id in the another user's joke array
  def test_if_another_user_jokes_array_is_correct
    @sal.tell(@ali, @joke_1)
    @sal.tell(@ali, @joke_2)

    assert_equal [@joke_1], @ali.joke_by_id(1)
    assert_equal [@joke_2], @ali.joke_by_id(2)
  end
end
