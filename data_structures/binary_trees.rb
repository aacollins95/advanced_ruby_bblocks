class Node
  include Enumerable
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end

  def <=>(other_node)
    value <=> other_node.value
  end

end

class BinaryTree
  def initialize(data)
    @data = data
    @root = Node.new(data.shift)
    #class variable node created for build_tree to use as reference
    @node = Node.new(data.shift)
    build_tree(data,@root)
    #@root.each do |i| puts i.value end
  end

  def build_tree(data,parent)
    return nil if data.empty?
    #where should the current node go? equal values end up in 'right' child
    @node.value < parent.value ? marker = 'left' : marker = 'right'
    if parent.send(marker) == nil
      parent.send("#{marker}=",@node)
    else
      build_tree(data,parent.send(marker))
    end
    @node = Node.new(data.shift)
    build_tree(data, @root)
  end

  def breadth_first_search(value)
    return if @root == nil
    q = [@root]
    while !q.empty?
      current = q[0]
      return current if current.value == value
      q.push(current.left) if current.left
      q.push(current.right) if current.right
      q.shift
    end
    return nil
  end


end

tree = BinaryTree.new([4,4,3,5,0,4,5,9,3,3])
puts tree.breadth_first_search(0)

#credit to florianmainguy, helped with build_tree algorithm
