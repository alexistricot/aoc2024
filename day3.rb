# Day 3 of the advent of code 2024

# regular input
input = File.read('inputs/day3.txt')
# example
# input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

mul_pattern = /mul\(([0-9]+),([0-9]+)\)/

mults = input.split("\n").map do |str|
  str.scan(mul_pattern).map { |list| list.map(&:to_i) }
end

puts mults.map { |list| list.map { |a, b| a * b }.sum }.sum

# Part 2

dos_regions = "do()#{input}".split("don't()").map do |str|
  str.split('do()')[1..]
end

results = dos_regions.flatten.map do |str|
    str.scan(mul_pattern).map do |a, b|
                        # puts [a, b].to_s
                        a.to_i * b.to_i
    end
end

puts results.flatten.sum
