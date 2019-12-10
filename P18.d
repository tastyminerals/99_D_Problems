/*
Extract a slice from a list.

Given two indices, I and K, the slice is the list containing the elements from and including the Ith element
up to but not including the Kth element of the original list. Start counting the elements with 0.

Example:
    slice(3, 7, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k']) -->
    ['d', 'e', 'f', 'g']
*/
import std.stdio;

dchar[] slice(in size_t start, in size_t end, dchar[] arr)
{
    return arr[start .. end];
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    slice(3, 7, darr);
}

unittest
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
    dchar[] result = ['d', 'e', 'f', 'g'];
    assert(slice(3, 7, darr) == result);
    writeln("Tests passed!");
}
