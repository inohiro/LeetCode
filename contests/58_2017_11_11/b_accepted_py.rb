# An implementation of https://discuss.leetcode.com/topic/110423/simple-python-solution/2 in Ruby

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

require 'pp'

def split_list_to_parts(root, k)
  if root.nil?
    res = []
    k.times { res << [] }
    return res
  end
  return [] if root.nil?
  length = 1
  length_ptr = root

  while length_ptr.next != nil do
    length_ptr = length_ptr.next
    length += 1
  end

  group_size = length / k
  overflow_group_count = length % k

  out = []
  ptr = root
  start = root

  k.times do 
    if start.nil?
      out << nil
    elsif overflow_group_count > 0
      out << start
      overflow_group_count -= 1

      group_size.times { ptr = ptr.next }
      start = ptr.next

      ptr.next = nil # remove pointer to children
      ptr = start
    else
      out << start

      (group_size-1).times { ptr = ptr.next }
      start = ptr.next
      ptr.next = nil
      ptr = start
    end
  end
  out
end

def array_to_list(array)
  if array.empty?
    nil
  else
    list = ListNode.new(array.shift)
    list.next = array_to_list(array)
    list
  end
end

[
  [[1,2,3], 5],                        #=> [[1],[2],[3],[],[]]
  [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],3], #=> [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]]
  [[1,2,3,4,5,6,7], 3],                #=> [[1,2,3],[4,5],[6,7]]
  [[], 3]                              #=> [[],[],[]]
].each do |ary,k|
  node = array_to_list(ary)
  pp split_list_to_parts(node, k)
end
