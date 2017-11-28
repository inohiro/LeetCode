# An implementation of solution

require 'pp'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  return nil if head == nil
  
  current = head
  while current != nil && current.next != nil do
    if current.next.val == current.val
      current.next = current.next.next
    else
      current = current.next
    end
  end
  head
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

# l = array_to_list([1,1,2])
l = array_to_list([1,1,2,3,3,3])
pp l
puts '--------------------'

pp delete_duplicates(l)
