class Node
  attr_accessor :left_child, :right_child, :parent, :deepest_left, :deepest_left_length, :deepest_right, 
                :deepest_right_length, :deepest_node, :deepest_node_length, :path, :name, :longest_path_length

  LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

  def initialize(parent, depth)
    if parent
      @@name_index += 1
      self.parent = parent
      self.name = LETTERS[@@name_index]
      self.path = parent.path + '->' + self.name
    else
      @@name_index = 0
      @@longest_path_node = nil
      self.name = LETTERS.first
      self.path = self.name
    end

    puts self.path

    if depth > 0
      self.left_child = Node.new(self, depth - 1) if rand * 10 > 3
      self.right_child = Node.new(self, depth - 1) if rand * 10 > 3
    end
  end

  def find_longest_path
    if self.left_child
      self.left_child.find_longest_path
      self.deepest_left = self.left_child.deepest_node
      self.deepest_left_length = self.left_child.deepest_node_length + 1
    else
      self.deepest_left = self
      self.deepest_left_length = 0
    end

    if self.right_child
      self.right_child.find_longest_path
      self.deepest_right = self.right_child.deepest_node
      self.deepest_right_length = self.right_child.deepest_node_length + 1
    else
      self.deepest_right = self
      self.deepest_right_length = 0
    end

    if self.deepest_left_length > self.deepest_right_length
      self.deepest_node = self.deepest_left
      self.deepest_node_length = self.deepest_left_length
    else
      self.deepest_node = self.deepest_right
      self.deepest_node_length = self.deepest_right_length
    end

    self.longest_path_length = self.deepest_left_length + self.deepest_right_length
    
    @@longest_path_node ||= self
    @@longest_path_node = self if self.longest_path_length > @@longest_path_node.longest_path_length

    # if we're at the root of the tree, print the results
    unless self.parent
      puts @@longest_path_node.deepest_left.name + "->" + @@longest_path_node.deepest_right.name
      puts @@longest_path_node.longest_path_length.to_s + " steps"
    end
  end
end
