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
  puts "----------------------------------"
  pp l1
  pp l2
  if l1 == nil
    return l2
  elsif l2 == nil
    return l1
  elsif l1.val < l2.val
    l1.next = merge_two_lists(l1.next, l2)
    return l1
  else
    l2.next = merge_two_lists(l1, l2.next)
    return l2
  end
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
