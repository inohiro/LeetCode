# https://leetcode.com/problems/add-two-numbers/

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
  l1_as_number = list_to_number(l1)
  l2_as_number = list_to_number(l2)
  pp l1_as_number
  pp l2_as_number
  result_as_number = l1_as_number + l2_as_number
  # pp result_as_number
  number_to_list(result_as_number, 1)
end

def list_to_number(list)
  current = list
  number = current.val
  digit = 1
  while(current.next !=nil)
    digit = digit * 10
    current = current.next
    number = number + current.val * digit
  end
  number
end

def number_to_list(number, digit)
  if number == 0
    ListNode.new(0)
  elsif number / digit == 0
    nil
  else
    val = number / digit % 10
    list = ListNode.new(val)
    list.next = number_to_list(number, digit * 10)
    list
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

l1 = array_to_list([2,4,3])
l2 = array_to_list([5,6,4])
# l1 = array_to_list([0])
# l2 = array_to_list([0])
pp l1
pp l2
puts '--------------------'
pp add_two_numbers(l1,l2)

# add_two_numbers(l1,l2)
