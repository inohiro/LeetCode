import java.util.HashSet;
import java.util.Set;

public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        Set<ListNode> hash = new HashSet<>();

        while (headA != null) {
            hash.add(headA);
            headA = headA.next;
        }

        while (headB != null) {
            if (hash.contains(headB)) {
                return headB;
            }
            headB = headB.next;
        }
        return null;
    }
}