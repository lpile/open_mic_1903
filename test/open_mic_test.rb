require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'pry'

class OpenMicTest < Minitest::Test
  # set up variables for test units
  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  # test if OpenMic class exist
  def test_it_exist
    assert_instance_of OpenMic, @open_mic
  end

  # test if OpenMic class has attributes
  def test_it_has_attributes
    assert_equal "Comedy Works", @open_mic.location
    assert_equal "11-20-18", @open_mic.date
    assert_equal [], @open_mic.performers
  end

  # test welcome method by adding to performers method
  def test_welcome_to_accept_users
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    assert_equal [@sal, @ali], @open_mic.performers
  end

  # test to see if user has same joke in jokes array
  def test_if_user_has_repeated_a_jokes
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    @open_mic.welcome(@ali)
    refute @open_mic.repeated_jokes?
  end

  # test to see if performers have same jokes
  def test_if_jokes_have_been_repeated
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    @open_mic.welcome(@ali)
    @ali.tell(@sal, @joke_1)
    assert @open_mic.repeated_jokes?
  end
end
