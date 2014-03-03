module CountingIntegerLength
  refine Integer do
    def length
      to_s.length
    end
  end
end
