def my_uniq(array)
  uniq_array = []

  array.each do |el|
    uniq_array << el unless uniq_array.include?(el)
  end

  uniq_array
end


def my_transpose(rows)
  dimension = rows.first.count
  cols = Array.new(dimension) { Array.new(dimension) }

  dimension.times do |i|
    dimension.times do |j|
      cols[j][i] = rows[i][j]
    end
  end

  cols
end