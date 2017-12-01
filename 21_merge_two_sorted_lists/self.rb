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
require 'pry'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  new_list = nil
  current = 0

  if l1.val < l2.val
    new_list = ListNode.new(l1.val)
    l1 = l1.next
  else
    new_list = ListNode.new(l2.val)
    l2 = l2.next
  end

  pp new_list
 
  while true do
    puts "--------------------------------"
    pp new_list
    if l1 !=nil && l1.val == current
      tmp = ListNode.new(current)
      l1 = l1.next
      new_list = put(new_list, tmp)
      pp new_list
      # new_list.next = tmp.val
      # new_list = new_list.next
      # tmp = new_list
    elsif l2 !=nil && l2.val == current
      tmp = ListNode.new(current)
      l2 = l2.next
      new_list.next = tmp
    end
    break if l1 == nil && l2 == nil
    current += 1
  end

  # while l1 != nil && l2 != nil do
  #   puts "------------------------------------"
  #   puts "l1.val: #{l1.val}, l2.val: #{l2.val}"
  #   binding.pry
  #   if l1.val < l2.val
  #     new_list = l1
  #     l1 = l1.next      
  #   else
  #     new_list = l2
  #     l2 = l2.next
  #     # new_list.next = nil
  #   end
  #   new_list.next = nil
  #   pp new_list
  #   new_list = new_list.next
  #   pp new_list
  # end
  new_list
end

def put(list, tmp)
  while list != nil do
    list = list.next
  end
  list = tmp
  list
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

l1 = array_to_list([1,2,3])
l2 = array_to_list([4,5,6])
pp merge_two_lists(l1,l2)

