# Sort an array in place and return the number of writes.
def cycle_sort(array)
  writes = 0

  # Loop through the array to find cycles to rotate.
  0.upto(array.length - 1) do |cycle_start|

    item = array[cycle_start]

    # Find where to put the item.
    pos = cycle_start
    (cycle_start + 1).upto(array.length - 1) do |i|
      pos += 1 if (array[i] < item)
    end

    # If the item is already there, this is not a cycle.
    next if (pos == cycle_start)

    # Otherwise, put the item there or right after any duplicates.
    while (item == array[pos])
      pos += 1
    end
    array[pos], item = item, array[pos]
    writes += 1

    # Rotate the rest of the cycle.
    while (pos != cycle_start)

      # Find where to put the item.
      pos = cycle_start
      (cycle_start + 1).upto(array.length - 1) do |i|
        pos += 1 if (array[i] < item)
      end

      # Put the item there or right after any duplicates.
      while (item == array[pos])
        pos += 1
      end
      array[pos], item = item, array[pos]
      writes += 1
    end
  end

  return writes

end

asdf = %w[9 8 7 6 5 4 3 2 1 0] # => ["9", "8", "7", "6", "5", "4", "3", "2", "1", "0"]
cycle_sort(asdf) # => 10
asdf # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
