# Algorithms and approaches

## Time Complexity for solution

- BigO(n)

## Empirical Proof of O(n)

Check out jupyter notebook `algo/collect_data.ipynb`

## Problem

Given a string of length `n` which only contains lowercase letters, find number of patterns that match following constraint: pattern should always be represented in form of alternate occurence of vowel and consonants. For instance, string `docomo` contains following patterns satisfying above scenario.

- do, oc, co, om, mo
- doc, oco, com, omo
- doco, ocom, como,
- docom, ocomo,
- docomo

Number of such patterns are 15 for `docomo`.

### Approaches

Initially, I tried using divide-and-conquer approach to solve the above. Using this approach, I was marking every vowel as `V` and consonant as `C`. This eventually led me to conclusion that I end up using my actual solution. During the implementation, I went on to write a method that basically collects the pattern which matches the condition described in solution. Later on, I found out that I only need the length of these strings not the string itself.

At this point of time, I had the solution, which will act as center logic for solution.

Apparently I was only using, divide-and-conquer approach to just mark character as `C` or `V`. This part was redundant and adding extra overhead since I already have a dictionary to figure that out. This is the reason I moved away from divide and conquer approach.

So, in order to replace above approach I have to find a way to get length of matching patterns. At this point, the primary solution has settled on fact that only length of all individual non-overlapping patterns is only needed to be calculate. For this following approach is used,

- intialize `counter` at 1, `is_last_char_vowel` as false.
- loop through every character of string, check if character is vowel/consonant and preserve this info for next iteration.
- on every iteration check if `is_current_char_vowel` == `is_last_char_vowel`, if true, store counter at that point of time as maximum length of pattern and reset `counter` to 1. if false, increase counter by 1. this happens until all of the characters in string are checked.

Note: Instead of storing length of counter, number of subpatterns from that length is calculated and added in total number of patterns found.

### Number of subpatterns within a string of length n

After going through some patterns, it became obvious that number of subpatterns for a given length was following formulae ```m*(m+1)/2```. Only difference is that for this problem's solution, `m = n - 1`.

### Important methods in code

- Calculate number of subpatterns given length n. `calculate_sum`
- Find length of individual non-overlapping patterns and store total number of patterns found. `create_final`
