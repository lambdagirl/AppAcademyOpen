module MazeClasses

  class Maze

    attr_reader :start_idx, :end_idx
    def initialize(mazefile)
      @title = parse_title(mazefile)
      @map = load_map(mazefile)
      @start_idx = find_start
      @end_idx = find_end
    end

    def parse_title(filename)
      filename.match(/(.+)\.txt/)[1]
    end

    def load_map(filename)
      maze = File.readlines(filename).map do |line| 
        line.split(//)
      end
    end


    def find_start
      find_char("S")
    end

    def find_end
      find_char("E")
    end

    def find_char(char)
      @map.each_with_index do |line,idx|
        if line.index(char)
          return [idx,line.index(char)]
        end
      end
    end

    def to_s
      string = "MAZE: #{@title}\n"
      @map.each do |line|
        string << line.join("")
      end
      string
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0] || "maze.txt"
  test_maze = MazeClasses::Maze.new(filename)
  puts test_maze
  puts "Start is at #{test_maze.start_idx}"
  puts "End is at #{test_maze.end_idx}"

end