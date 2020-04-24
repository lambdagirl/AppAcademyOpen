module MazeClasses

  class Maze
    DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

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
    def isValid?(x, y)
      return x >= 0 && x < @map.length && y >= 0 && y < @map[0].length && @map[x][y] != "*" 
    end

    def find_neighbors(pos)
      r,c =pos
      neighbors =[]
      DELTAS.each do |x,y|
        neighbors << [x+r,y+c] if isValid?(x+r,y+c)
      end
      neighbors
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

    def travel_path(path)
      puts "Traveling path of #{path.inspect}..."
      copy_map = deep_dup(@map)
      path.each do |coords|
        x, y = coords
        point = copy_map[x][y]
        if point == "X"
          puts "This path back-tracks to #{x}, #{y}."
        elsif point == "*"
          puts "This path hits a wall at #{x}, #{y}."
        else
          copy_map[x][y] = "X"
        end 
      end 

      show_path(copy_map)
    end

    def show_path(map)
      map.each do |line|
        puts line.join("")
      end
    end
    private

    def deep_dup(item)
      unless item.class == Array
        item.dup
      else
        new_arr = []
        item.each do |item|
          new_arr << deep_dup(item)
        end
        new_arr
      end
    end
    
  end

  class Maze_Solver
    attr_reader :current, :end_idx, :maze

    def initialize(maze)
      @maze = maze
      @current = @maze.find_start
      @branching_paths ={}
    end 
    # A utility function to check if x, y is valid 

    def bfs
      queue = [current]
      visited = []
      until queue.empty? || current ==maze.find_end
        current = queue.shift
        queue.delete(current)
        visited << current
        nearby_openings = maze.find_neighbors(current)
        nearby_openings.each do |neighbor|
          puts current
          unless visited.include?(neighbor) || queue.include?(neighbor)
            queue << neighbor
            @branching_paths[neighbor] = current
          end
        end
          
      end
      @branching_paths
    end

    def find_path(goal = maze.find_end)
      path = [goal]
      spot = goal
      until @branching_paths[spot] == nil
        path << @branching_paths[spot] 
        spot = @branching_paths[spot]
      end
      path
    end

    
    def solve
      bfs
      path = find_path
      maze.travel_path(path)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0] || "maze.txt"
  test_maze = MazeClasses::Maze.new(filename)
  puts test_maze
  puts test_maze.isValid?(0,0)
  puts "Start is at #{test_maze.start_idx}"
  puts "End is at #{test_maze.end_idx}"
  test_solver = MazeClasses::Maze_Solver.new(test_maze)
  puts test_solver.solve
end