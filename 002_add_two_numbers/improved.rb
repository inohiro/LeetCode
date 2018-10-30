# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8

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
def add_two_numbers(l1, l2)
  dummy = ListNode.new(0)
  current = dummy
  p = l1
  q = l2
  carry = 0
  while (p != nil || q != nil) do
    x = p.val ? p.val : 0
    y = q.val ? q.val : 0
    sum = x + y + carry
    carry = sum / 10
    # current.val = sum % 10
    current.next = ListNode.new(sum % 10)
    current = current.next
    p = p.next if p != nil
    q = q.next if q != nil
  end
  if carry > 0
    current.next = ListNode.new(carry)
  end
  dummy.next
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

l1 = array_to_list([2,4,3])
l2 = array_to_list([5,6,4])
# l1 = array_to_list([0])
# l2 = array_to_list([0])
pp l1
pp l2
puts '--------------------'
pp add_two_numbers(l1,l2)

# add_two_numbers(l1,l2)
