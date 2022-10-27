require 'pry'
require_relative 'node'

class Tree
  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    if arr.empty?
      return
    end

    mid = arr.length/2

    new_node = Node.new(arr[mid])

    new_node.left = build_tree(arr.slice(0, mid))
    new_node.right = build_tree(arr.slice(mid + 1, arr.length - 1))

    new_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(current_node = @root, value)
    new_node = Node.new(value)

    if current_node.nil?
      return new_node
    end

    if value < current_node.value
      current_node.left = insert(current_node.left, value)
    else
      current_node.right = insert(current_node.right, value)
    end

    current_node
  end

  def min_value(node)
    current_node = node
    current_node = current_node.left.nil?
    current_node
  end

  def delete(current_node = @root, value)
    if current_node.nil?
      return current_node
    end

    if value < current_node.value
      current_node.left = delete(current_node.left, value)
    elsif value > current_node.value
      current_node.right = delete(current_node.right, value)
    else
      if current_node.left.nil?
        temp = current_node.right
        current_node = nil
        return temp
      elsif current_node.right.nil?
        temp = current_node.left
        current_node = nil
        return temp
      end

      temp = min_value(current_node.right)
      current_node.value = temp
      current_node.right = delete(current_node.right, temp)
    end

    current_node
  end

  def find(current_node = @root, value)
    if current_node.nil?
      return current_node
    end

    find(current_node.right, value)
    find(current_node.left, value)

    if current_node.value == value
      puts current_node
      puts current_node.value
    end
  end

  def max_height(l_height, r_height)
    if l_height > r_height
      return l_height
    else
      return r_height
    end
  end

  def height(current_node = @root)
    if current_node.nil?
      return -1
    end

    l_height = height(current_node.left)
    r_height = height(current_node.right)

    max_height(l_height, r_height) + 1
  end

  def depth(current_node = @root, value)
    if current_node.nil?
      return -1
    end

    dist = -1

    if current_node.value == value
      return dist + 1
    end

    dist = depth(current_node.left, value)

    if dist >= 0
      return dist + 1
    end

    dist = depth(current_node.right, value)
    
    if dist >= 0
      return dist + 1
    end

    dist
  end

  def level_order(current_node = @root)
    queue = []
    visited = []

    #add root value to queue
    queue.push(current_node)

    while !queue.empty?
      queue_len = queue.length
      level = []
      
      queue_len.times do
        node = queue.shift
        
        level.push(node.value)
          
        if !node.left.nil?
          queue.push(node.left)
        end

        if !node.right.nil?
          queue.push(node.right)
        end
      end

      if !level.nil?
        yield level
      end
    end
  end

  def inorder(current_node = @root, visited = [], &block)
    if current_node.nil?
      return
    end

    inorder(current_node.left, visited, &block)

    if block_given?
      yield current_node
    end

    visited.push(current_node.value)

    inorder(current_node.right, visited, &block)

    visited
  end

  def preorder(current_node = @root, visited = [], &block)
    if current_node.nil?
      return
    end

    if block_given?
      yield current_node
    end

    visited.push(current_node)

    preorder(current_node.left, visited, &block)
    preorder(current_node.right, visited, &block)
  end

  def postorder(current_node = @root, visited = [], &block)
    if current_node.nil?
      return
    end
    
    postorder(current_node.left, visited, &block)
    postorder(current_node.right, visited, &block)

    if block_given?
      yield current_node
    end

    visited.push(current_node)
  end

  def balanced?(current_node = @root)
    if current_node.nil?
      return true
    end

    l_height = height(current_node.left)
    r_height = height(current_node.right)

    if ((l_height - r_height).abs <= 1 && balanced?(current_node.left) && balanced?(current_node.right))
      return true
    end

    return false
  end

  def rebalance(current_node = @root)
    balanced_arr = inorder(current_node)
    @root = build_tree(balanced_arr)
  end
end
