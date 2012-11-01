require 'spec_helper'
require_relative '../lib/fracciones'

describe Fraccion do
  context "constructor" do
    it "Crea la fraccion irreducible" do
      fraccion = Fraccion.new(2,3)

      fraccion.numerador.should be 2
      fraccion.denumerador.should be 3
    end
  end
end
