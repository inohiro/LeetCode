import java.util.HashSet;
import java.util.Set;

public class Solution {
    public boolean hasCycle(ListNode head) {
        Set<ListNode> nodes = new HashSet<>();
        // nodes.add(head);
        while (head != null) {
            if (nodes.contains(head)) {
                return true;
            }
            else {
                nodes.add(head);
            }
            head = head.next;
        }
        return false;
    }
}
