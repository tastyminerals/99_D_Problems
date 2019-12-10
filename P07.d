/*
    Flatten a nested array structure.

    Example:
    flatten([[1, 1], [2], [3], [5, 8]]); --> [1, 1, 2, 3, 5, 8]

    A more generic solution is presented here: https://rosettacode.org/wiki/Flatten_a_list#D
*/

import std.array;
import package_utils : writeResult;

T[] flatten(T)(T[][] arr)
{
    return arr.join.array;
}

void main()
{

    int[][] arr0 = [[1, 1], [2], [3], [5, 8]];
    dchar[][] arr1 = [['a', 'b'], ['c'], ['d', 'e']];
    writeResult(arr0, flatten(arr0));
    writeResult(arr1, flatten(arr1));

}

unittest
{
    int[][] arr0 = [[1, 1], [2], [3], [5, 8]];
    dchar[][] arr1 = [['a', 'b'], ['c'], ['d', 'e']];
    dchar[] darr1 = ['a', 'b', 'c', 'd', 'e'];
    assert(flatten(arr0) == [1, 1, 2, 3, 5, 8]);
    assert(flatten(arr1) == darr1);
}
