module StringRotations

  refine String do
    def rotations
      char_array = chars
      length.times.map do
        char_array.rotate!.join
      end
    end
  end

end