module Contexts
  module Plates
    # Context for plates
    def create_plates
      @plate1 = Plate.new("plate 1", {@apple => 1, @banana => 1, @pie => 1, @pizza => 1})
      @plate2 = Plate.new("plate 2", {@apple => 2, @banana => 2, @pie => 2})
      @plate3 = Plate.new("plate 3", {@apple => 0})
      @plate4 = Plate.new("plate 4", {@apple => 0.5})
      @plate5 = Plate.new("plate 5", {})
    end

    def destroy_plates
      @plate1 = nil
      @plate2 = nil
      @plate3 = nil
      @plate4 = nil
      @plate5 = nil
    end

  end

end

