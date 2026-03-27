package leetcode.Top150.Q0026_Remove_Duplicates_from_Sorted_Array

class Solution {
    fun removeDuplicates(nums: IntArray): Int {
        var swapIdx = 0
        var idx = 0
        while(idx < nums.size) {
            if(nums[swapIdx] < nums[idx]){
                nums[++swapIdx] = nums[idx]
            }
            idx++
        }

        return swapIdx + 1
    }
}