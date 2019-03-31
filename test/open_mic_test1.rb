require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke_1'
require './lib/user_1'
require './lib/open_mic_1'

class OpenMicTest1 < Minitest::Test
  def setup
    @joke_1 = Joke1.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke1.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @sal = User1.new("Sal")
    @ali = User1.new("Ali")
    @open_mic = OpenMic1.new({location: "Comedy Works", date: "11-20-18"})
  end

  def test_it_exists
    assert_instance_of OpenMic1, @open_mic
  end

  def test_it_has_attributes
    assert_equal "Comedy Works", @open_mic.location
    assert_equal "11-20-18", @open_mic.date
    assert_equal [], @open_mic.performers
  end

  def test_it_welcomes_users_and_adds_to_performers_array
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_if_any_jokes_were_repeated
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)
    @open_mic.welcome(@ali)

    refute @open_mic.repeated_jokes?
    
    @sal.tell(@ali, @joke_1)

    assert @open_mic.repeated_jokes?
  end
end
