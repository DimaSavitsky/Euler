module DeterminingPandigitalNumber

  refine Integer do

    def pandigital_ends?
      starts_with_pandigital? && ends_with_pandigital?
    end

    private

    def includes_all_digits?(array)
      array = array.map(&:to_s)
      (1..9).map(&:to_s).all? { |digit| array.include? digit }
    end

    def ends_with_pandigital?
      includes_all_digits? to_s.each_char.reverse_each.first(9)
    end

    def starts_with_pandigital?
      includes_all_digits? to_s.each_char.first(9)
    end

  end

end
