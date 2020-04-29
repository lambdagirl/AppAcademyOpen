def all_words_capitalized?(array)
    array.all?{|word| word.capitalize == word}
end

def no_valid_url?(array)
    url_ending = ['.com', '.net', '.io', '.org']
    array.none? do |url|
        url_ending.any? {|ending| url.end_with?(ending)}
    end
end

def any_passing_students?(students)
    students.any? do |student|
        (student[:grades].sum / (student[:grades].length*1.0))>= 75
    end
end

