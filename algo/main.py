import string
import random

# Count of alternate vowel consonant sequence

# sample

# DOCOMO - 15
# PRASHANT - 6
# GOD - 3

vowels = {
    'a': True,
    'e': True,
    'i': True,
    'o': True,
    'u': True
}
# 6 - 1
# 5 - 2
# 4 - 3
# 3 - 4
# 2 - 5
## 1 - 6

# this is part of divide and conquer approach.
# this part end up being extra code.
def split_sequence(sequence, low, high):
    if not sequence:
        return ''

    if high == low + 1:
        return 'V' if vowels.get(sequence[low]) else 'C'

    middle = (high + low)//2

    return split_sequence(sequence[low:middle], 0, middle-low) + split_sequence(sequence[middle:high], 0, high-middle)

# this is the real deal.
# all you have to do is find length of substring matching constraint.
# this will give you number of patterns that can be made from that.
# for instance a substring of 6 characters matching constraints
# will generate 15 possible sub patterns matching same constraint.
# which is equal to sum(5+4+3+2+1) which further translates to formulae n(n+1)/2.
def calculate_sum(n):
    return (n-1)*(n)/2

# here we are maintaining counter, which will increase until pattern is satisfying constraint
# whenever constraint fails, calculate_sum is called to find maximum number of sub patterns within that length.
# also, counter is reset to 1. finally sum of count of all sub patterns is returned.
def create_final(s):
    count, pattern_length, is_last_char_vowel, has_last_char = 0, 1, False, False
    for i in s:
        is_vowel = vowels.get(i, False)

        if is_vowel == is_last_char_vowel:
            if pattern_length > 1:
                count += calculate_sum(pattern_length)
                pattern_length = 1
        elif has_last_char:
            pattern_length += 1

        is_last_char_vowel = is_vowel

        # this can be also solved by using string index instead of a flag.
        if not has_last_char:
            has_last_char = True

    if pattern_length > 1:
        count += calculate_sum(pattern_length)

    return int(count)


def get_count(string):
    # split_string = split_sequence(string, 0, len(string))
    return create_final(string) # O(n)


def generate_random_string(n):
    return ''.join(random.choices(string.ascii_lowercase, k = n))


if __name__ == '__main__':
    c = get_count('god')
    print(c)

    c = get_count('prashant')
    print(c)

    c = get_count('docomo')
    print(c)

    # single vowel
    c = get_count('a')
    print(c)

    # single consonant
    c = get_count('b')
    print(c)

    # all vowels
    c = get_count('aeiou')
    print(c)

    # all consonants
    c = get_count('bcdfghjklmnpqrstvwxyz')
    print(c)

    c = get_count('ab')
    print(c)

    c = get_count('ape')
    print(c)

    c = get_count('ambigious')
    print(c)

    # using random.choices() 
    # generating random strings  
    res = generate_random_string(10000)
    c = get_count(res)
    print(c)

    # print(res)
