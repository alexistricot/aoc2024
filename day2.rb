# Day 2 of the advent of code 2024

input = File.read('inputs/day2.txt').split("\n").map { |str| str.split(' ') }.map { |list| list.map(&:to_i) }

def get_diff(list)
  list.each_cons(2).map { |a, b| b - a }
end

def is_safe(list)
  list.all? { |x| x >= 1 and x <= 3 } | list.all? do |x|
    x <= -1 and x >= -3
  end
end

b_to_i = ->(b) { b ? 1 : 0 }

diffs = input.map { |list| get_diff(list) }
is_safe_report = diffs.map { |list| is_safe(list) }
puts is_safe_report.map(&b_to_i).sum

def list_without(list, i)
  i.zero? ? list[1..] : [*list[0..i - 1], *list[i + 1..]]
end

is_safe_dampened = lambda { |list|
  is_safe(get_diff(list)) or list.length.times.any? { |i| is_safe(get_diff(list_without(list, i))) }
}

puts input.map(&is_safe_dampened).map(&b_to_i).sum
