class Team
  MARKUP_PER_PERSON = 1.2

  attr_reader :num_people
  attr_reader :markup

  def initialize(num_people)
    raise ArgumentError, "Expected integer argument" unless num_people.is_a? Integer
    raise ArgumentError, "Argument must be greater than 0" unless num_people > 0
    @num_people = num_people
    @markup = num_people * MARKUP_PER_PERSON
  end
end