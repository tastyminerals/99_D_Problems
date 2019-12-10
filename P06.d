/*
    Find out whether a array is a palindrome.

    Example:
    isPalindrome([1, 2, 3, 2, 1]) --> true
*/

import std.array : array;
import std.range : enumerate;
import std.algorithm : reverse, map;
import package_utils : writeResult;

bool isPalindrome(T)(T[] arr)
{
    // HINT: .array always allocates new array
    auto reversedArr = arr.dup.reverse.array;
    return arr == reversedArr;
}

bool isPalindromeMap(T)(T[] arr)
{
    auto reversedArr = arr.enumerate.map!(t => arr[arr.length - 1 - t[0]]);
    return arr == reversedArr.array;
}

void main()
{
    int[] arr0 = [1, 2, 3, 2, 1];
    char[] arr1 = ['a', 'b', 'b', 'a'];
    dstring str = "racecar"d;
    writeResult(arr0, isPalindrome(arr0));
    writeResult(str, isPalindrome(str));
    writeResult(arr1, isPalindromeMap(arr1));
}

unittest
{
    import std.stdio : writeln;

    int[] arr0 = [1, 2, 3, 2, 1];
    char[] arr1 = ['a', 'b', 'b', 'a'];
    int[] arr2 = [1, 1, 2, 2];
    dstring str = "racecar"d;
    assert(isPalindrome(arr0));
    assert(isPalindromeMap(arr1));
    assert(isPalindromeMap(str));
    assert(isPalindrome(arr2) == false);
    writeln("All tests passed!");
}
