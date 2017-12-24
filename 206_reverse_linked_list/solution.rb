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
  prev = nil
  current = head

  while current != nil do
    tmp_next = current.next
    current.next = prev
    prev = current
    current = tmp_next
  end

  prev
end

