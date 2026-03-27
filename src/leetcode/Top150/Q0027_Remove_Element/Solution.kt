package leetcode.Top150.Q0027_Remove_Element

class Solution {
    fun removeElement(nums: IntArray, `val`: Int): Int {
        var index = 0
        for(i in nums.indices) {
            if(nums[i] != `val`) {
                nums[index] = nums[i]
                index++
            }
        }

        return index
    }
}