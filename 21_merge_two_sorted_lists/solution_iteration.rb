# 21. Merge Two Sorted Lists
# https://leetcode.com/problems/merge-two-sorted-lists/

# Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

require 'pp'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l2 if l1 == nil
  return l1 if l2 == nil

  pre_head = ListNode.new(nil)
  pre_head.next = l1
  prev = pre_head

  while l1 && l2 do
    if l1.val <= l2.val
      l1 = l1.next
    else
      l1_tail = prev.next
      prev.next = l2
      l2 = l2.next
      prev.next.next = l1_tail
    end
    prev = prev.next
  end

  if l1 == nil
    prev.next = l2
  else
    prev.next = l1
  end
  pre_head.next
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

l1 = array_to_list([1,3,5])
l2 = array_to_list([2,4,6])
pp merge_two_lists(l1,l2)
