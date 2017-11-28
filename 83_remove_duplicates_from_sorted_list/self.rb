# 80. Remove duplicates from sorted list
# https://leetcode.com/problems/remove-duplicates-from-sorted-list/

# Given a sorted linked list, delete all duplicates such that each element appear only once.

# For example,
# Given 1->1->2, return 1->2.
# Given 1->1->2->3->3, return 1->2->3.

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

  i = head.val
  new_list = ListNode.new(head.val)
  new_head = new_list
  current = head

  while current != nil do
    if current.val != i
      i = current.val
      new_list.next = ListNode.new(current.val)
      new_list = new_list.next
    end
    current = current.next
  end
  new_head
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
