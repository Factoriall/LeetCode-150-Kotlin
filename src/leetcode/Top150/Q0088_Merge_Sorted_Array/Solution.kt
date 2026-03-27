package leetcode.Top150.Q0088_Merge_Sorted_Array

class Solution {
    fun majorityElement(nums: IntArray): Int {
        var majorNum = nums[0]
        var majorCount = 1
        var idx = 1
        while(idx < nums.size) {
            if(majorCount == 0) {
                majorNum = nums[idx++]
                majorCount = 1
                continue
            }
            if(majorNum == nums[idx++]) {
                majorCount++
            } else {
                majorCount--
            }
        }

        return majorNum
    }
}