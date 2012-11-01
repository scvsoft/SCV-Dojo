require 'test/unit'
require 'fracciones'

class TestFracciones < Test::Unit::TestCase
  def test_constructor_fraccionIrreducible_creaLaFraccion
    fraccion = Fraccion.new(2,3)

    assert_equal fraccion.numerador, 2
    assert_equal fraccion.denumerador, 3
  end
end
