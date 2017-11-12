# 725. Split Linked List in Parts My SubmissionsBack to Contest
# https://leetcode.com/contest/weekly-contest-58/problems/split-linked-list-in-parts/

# Given a (singly) linked list with head node root, write a function to split the linked list into k consecutive linked list "parts".

# The length of each part should be as equal as possible: no two parts should have a size differing by more than 1. This may lead to some parts being null.

# The parts should be in order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal parts occurring later.

# Return a List of ListNode's representing the linked list parts that are formed.

# Examples 1->2->3->4, k = 5 // 5 equal parts [ [1], [2], [3], [4], null ]


# Example 1:
# Input: 
# root = [1, 2, 3], k = 5
# Output: [[1],[2],[3],[],[]]
# Explanation:
# The input and each element of the output are ListNodes, not arrays.
# For example, the input root has root.val = 1, root.next.val = 2, \root.next.next.val = 3, and root.next.next.next = null.
# The first element output[0] has output[0].val = 1, output[0].next = null.
# The last element output[4] is null, but it's string representation as a ListNode is [].

# Example 2:
# Input: 
# root = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], k = 3
# Output: [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]]
# Explanation:
# The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.

# Note:

# - The length of root will be in the range [0, 1000].
# - Each value of a node in the input will be an integer in the range [0, 999].
# - k will be an integer in the range [1, 50].

# Definition for singly-linked list.

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

require 'pp'

# @param {ListNode} root
# @param {Integer} k
# @return {ListNode[]}
def split_list_to_parts(root, k)
  ary = list_to_array(root)
  length = ary.length

  if length < k
    result = ary.each_slice(1).to_a
    while result.length < k do
      result << []
    end
    result
  else
    result = []
    e = if length % 2 == 0
          length / k
        else
          length / k + 1
        end
    # puts "e: #{e}"
    while ary.size > 0 do
      result << ary.shift(e).to_a
      if ary.length < e
        result << ary.shift(ary.length)
      end
    end
    result
  end
end


def list_to_array(list)
  array = []
  while list != nil do
    array << list.val
    list = list.next
  end
  array
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
  [[1,2,3,4,5,6,7], 3]                 #=> [[1,2,3],[4,5],[6,7]]
].each do |ary,k|
  node = array_to_list(ary)
  pp split_list_to_parts(node, k)
end
