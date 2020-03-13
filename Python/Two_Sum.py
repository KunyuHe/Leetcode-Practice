class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        val_ind = dict()
        for i, val in enumerate(nums):
            other = target - val
            if other in val_ind:
                return i, val_ind[other]
            if val not in val_ind:
                val_ind[val] = i
