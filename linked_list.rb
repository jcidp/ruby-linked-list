# frozen_string_literal: true

# Node for linked lists
class Node
  attr_accessor :next_node
  attr_reader :value

  private

  attr_writer :value

  def initialize(value = nil, next_node = nil)
    self.value = value
    self.next_node = next_node
  end
end

# Link List class
class LinkedList
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def append(value)
    return self.head = Node.new(value) if head.nil?

    node = head
    node = node.next_node until node.next_node.nil?
    node.next_node = Node.new(value)
  end

  def prepend(value)
    old_head = head
    self.head = Node.new(value)
    head.next_node = old_head
  end

  def size
    count = 0
    node = head
    until node.nil?
      node = node.next_node
      count += 1
    end
    count
  end

  def tail
    node = head
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index)
    node = head
    index.times { node = node.next_node }
    node
  end

  def pop
    at(size - 2).next_node = nil
  end

  def contains?(value)
    node = head
    until node.nil?
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    i = 0
    node = head
    until node.nil?
      return i if node.value == value

      node = node.next_node
      i += 1
    end
    nil
  end

  def to_s
    str = ""
    node = head
    until node.nil?
      str += "( #{node.value} ) -> "
      node = node.next_node
    end
    "#{str}nil"
  end

  def insert_at(value, index)
    return if index >= size
    return prepend(value) if index.zero?

    node = at(index - 1)
    next_node = node.next_node
    node.next_node = Node.new(value)
    node.next_node.next_node = next_node
  end

  def remove_at(index)
    return if index >= size
    return self.head = head.next_node if index.zero?

    node = at(index - 1)
    node.next_node = node.next_node.next_node
  end
end
