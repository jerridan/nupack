class Team
  attr_reader :num_people

  def initialize(num_people)
    raise ArgumentError, "Expected integer argument" unless num_people.is_a? Integer
    raise ArgumentError, "Argument must be greater than 0" unless num_people > 0
    @num_people = num_people
  end
end