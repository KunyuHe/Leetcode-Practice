class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            return False
        
        p, rev = x, 0
        while p:
            rev = rev*10 + p%10
            p = int(p/10)

        return x == rev
