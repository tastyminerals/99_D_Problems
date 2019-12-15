/*
Generate the combinations of K distinct objects chosen from the N elements of a list.
Distinct means ['a', 'b'] == ['b', 'a'] so it is different from K permutations.

In how many ways can a committee of 3 be chosen from a group of 12 people?
We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficient).
For pure mathematicians, this result may be great. But we want to really generate all the possibilities.

Example:
    combinations(3, ['a', 'b', 'c', 'd', 'e', 'f']) -->
    [['a', 'b', 'c']], ['a', 'b', 'd'], ['a', 'b', 'e'], ['a', 'b', 'f'], ['b', 'c', 'd'], ['b', 'c', 'e']...]
*/

import std.stdio;
import std.range;
import std.algorithm : permutations;

void print(string msg)
{
    writeln(msg);
    readf(" %s");
}

dchar[][] combinations(int k, dchar[] darr)
{
    dchar[][] res;
    void comb(int n, int start = 0, dchar[] arr = [])
    {
        if (n == 0)
        {
            res ~= arr;
        }
        else
        {
            foreach (i; start .. darr.length)
            {
                arr ~= darr[i];
                comb(n - 1, i + 1, arr);
                arr.popBack;
            }
        }
    }

    comb(k);
    return res;
}

void main()
{
    dchar[] darr = ['a', 'b', 'c', 'd', 'e', 'f'];
    writeln(combinations(3, darr));
}

unittest
{
    dchar[] darr = ['a', 'b', 'c'];
    dchar[][] res = [['a', 'b'], ['a', 'c'], ['b', 'c']];
    assert(combinations(2, darr) == res);
    assert(fac!(4) == 24);
    assert(fac!(5) == 120);
    assert(binomialCoefficient!(12, 3) == 220);
}

// Some unused functions to try template recursion.
// factorial function that is evaluated at compile time
// recursive template function
int fac(int i)()
{
    return i * fac!(i - 1)();
}

// template specialization to terminate template function recursion
int fac(int i : 1)()
{
    return 1;
}

int binomialCoefficient(int n, int k)()
{
    static if (n <= k)
    {
        return 0;
    }
    else
    {
        return fac!(n) / (fac!(k) * fac!(n - k));
    }
}
