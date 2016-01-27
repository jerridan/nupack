class NuPack
  FLAT_MARKUP = 0.05

  def calc_price(base_price, team, package)
    raise ArgumentError, "expected numeric first argument" unless base_price.is_a? Numeric
    raise ArgumentError, "expected second argument of type Team" unless team.is_a? Team
    raise ArgumentError, "expected third argument of type Package" unless package.is_a? Package

    return (base_price*(FLAT_MARKUP + 1))*(1 + team.markup + package.markup)
  end
end