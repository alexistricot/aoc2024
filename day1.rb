# Day 1 of the advent of code 2024

input = File.read('./inputs/day1.txt')

diffs = input.split("\n").map do |str|
    str.split(' ')
end.transpose.map { |arr| arr.map(&:to_i) }.map(&:sort).transpose.map { |arr| (arr[1] - arr[0]).abs }

puts diffs.sum

a, b = input.split("\n").map do |str|
    str.split(' ')
end.transpose.map { |arr| arr.map(&:to_i) }

b_tally = b.tally
similarities = a.map { |id| b_tally.key?(id) ? id * b_tally[id] : 0 }

puts similarities.sum
