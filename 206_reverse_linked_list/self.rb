# 206. Reverse Linked list
# https://leetcode.com/problems/reverse-linked-list/

# Reverse a singly linked list.

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
def reverse_list(head)
  result = nil
  current = head
  vals = []

  while current !=nil do
    vals << current.val
    current = current.next
  end

  result = ListNode.new(vals.pop)
  result_head = result
  vals.reverse.each do |val|
    result.next = ListNode.new(val)
    result = result.next
  end

  return result_head
end

