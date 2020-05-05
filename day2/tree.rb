class Tree
  attr_accessor :children, :node_name, :level

  def initialize(name, children, level = 1)
    @node_name = name
    @level = level
    @children = children.map do |c_name, c_children|
      Tree.new(c_name, c_children, level + 1)
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end

  def print_tree
    visit_all do |node|
      puts "#{'-' * (node.level - 1)}#{node.node_name}"
    end
  end
end


# ruby_tree = Tree.new( "Ruby", [Tree.new("Reia"), Tree.new("MacRuby")] )

ancestors = {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
}

ruby_tree = Tree.new('grandpa', ancestors['grandpa'])

ruby_tree.print_tree
