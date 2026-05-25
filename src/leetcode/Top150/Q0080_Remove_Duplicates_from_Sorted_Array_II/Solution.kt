package leetcode.Top150.Q0080_Remove_Duplicates_from_Sorted_Array_II

class Solution {
    fun removeDuplicates(nums: IntArray): Int {
        var i = 0
        var rIdx = 0
        while (i < nums.size) {
            if (i < 2) {
                i++
                rIdx++
                continue
            }

            if (nums[rIdx - 2] != nums[i]) {
                nums[rIdx++] = nums[i]
            }
            i++
        }

        return rIdx
    }
}
