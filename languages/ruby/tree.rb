class Tree

  attr_accessor :node_name, :children

  def initialize(name, children = [])
    @node_name = name
    @children = children
  end

  def visit(&block)
    block.call self
    self
  end

  def visit_all(&block)
    block.call self
    children.each {|child| child.visit_all(&block) }
    self
  end

end
