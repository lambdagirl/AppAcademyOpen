class PolyTreeNode
  attr_reader :parent, :children, :value
  def initialize(value = nil)
      @value, @parent, @children = value, nil, []
  end


  def parent=(parent)
      return if self.parent == parent
      if self.parent
          self.parent.children.delete(self)
      end
      @parent = parent
      self.parent.children << self unless self.parent.nil?
  end
  
  def add_child(child)
    child.parent=self
  end

  def remove_child(child)
    if child && !self.children.include?(child)
        raise "Tried to remove node that isn't a child"
    end
    child.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
        result = child.dfs(target_value)
        return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    q = [self]
    until q.empty?
        node = q.shift
        return node if node.value == target_value
        node.children.each {|child| q << child }
    end
    nil
  end
end

