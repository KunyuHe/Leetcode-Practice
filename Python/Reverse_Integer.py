class Solution:
    def reverse(self, x: int) -> int:
        if x < 0:
            output = -int(str(-x)[::-1])
        else:
            output = int(str(x)[::-1])

        return (output, 0)[output >= 2**31 or output < -2**31]