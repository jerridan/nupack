class Package
  FOOD_MARKUP = 0.13
  DRUGS_MARKUP = 0.075
  ELECTRONICS_MARKUP = 0.2

  attr_reader :type
  attr_reader :markup

  def initialize(type)
    raise ArgumentError, "expected string argument" unless type.is_a? String
    @type = type
    calcMarkup
  end

  def calcMarkup()
    if "food" == @type
      @markup = FOOD_MARKUP
    elsif "drugs" == @type
      @markup = DRUGS_MARKUP
    elsif "electronics" == @type
      @markup = ELECTRONICS_MARKUP
    else
      @markup = 0
    end
  end
end