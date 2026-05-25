package leetcode.Top150.Q0080_Remove_Duplicates_from_Sorted_Array_II

class Solution {
    fun removeDuplicates(nums: IntArray): Int {
        var i = 1
        var rIdx = 1
        var num = nums[0]
        var isDuplicatedOnce = false
        var k = nums.size
        while (i < nums.size) {
            if (num == nums[i]) {
                if (isDuplicatedOnce) {
                    k--
                    i++
                    continue
                }
                isDuplicatedOnce = true
            } else {
                num = nums[i]
                isDuplicatedOnce = false
            }

            nums[rIdx++] = nums[i++]
        }

        return k
    }
}
