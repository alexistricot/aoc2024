# Day 4 of the advent of code 2024

input = File.read('inputs/day4.txt')
# input = File.read('inputs/day4_example.txt')
matrix = input.split("\n").map { |str| ('BBBB' + str + 'BBBB').split('') }
4.times { |_| matrix.unshift(['B'] * matrix[0].length) }
4.times { |_| matrix.push(['B'] * matrix[0].length) }

N = matrix.length - 8
M = matrix[0].length - 8

def is_xmas(a, b, c, d)
    ((a == 'X') and (b == 'M') and (c == 'A') and (d == 'S')) ? 1 : 0
end

def look_for_xmas(matrix, i, j)
    n = 0
    n if matrix[i][j] != 'X'
    # North
    n += is_xmas(matrix[i][j], matrix[i + 1][j], matrix[i + 2][j], matrix[i + 3][j])
    # North-east
    n += is_xmas(matrix[i][j], matrix[i + 1][j + 1], matrix[i + 2][j + 2], matrix[i + 3][j + 3])
    # East
    n += is_xmas(matrix[i][j], matrix[i][j + 1], matrix[i][j + 2], matrix[i][j + 3])
    # South-east
    n += is_xmas(matrix[i][j], matrix[i - 1][j + 1], matrix[i - 2][j + 2], matrix[i - 3][j + 3])
    # South
    n += is_xmas(matrix[i][j], matrix[i - 1][j], matrix[i - 2][j], matrix[i - 3][j])
    # South-west
    n += is_xmas(matrix[i][j], matrix[i - 1][j - 1], matrix[i - 2][j - 2], matrix[i - 3][j - 3])
    # West
    n += is_xmas(matrix[i][j], matrix[i][j - 1], matrix[i][j - 2], matrix[i][j - 3])
    # North-west
    n += is_xmas(matrix[i][j], matrix[i + 1][j - 1], matrix[i + 2][j - 2], matrix[i + 3][j - 3])

    n
end

puts (4..N + 3).map { |i| (4..M + 3).map { |j| look_for_xmas(matrix, i, j) } }.flatten.sum

def look_for_cross_mas(matrix, i, j)
    return 0 if matrix[i][j] != 'A'

    ne_sw = ((matrix[i - 1][j - 1] == 'M') && (matrix[i + 1][j + 1] == 'S')) || ((matrix[i - 1][j - 1] == 'S') && (matrix[i + 1][j + 1] == 'M'))
    nw_se = ((matrix[i - 1][j + 1] == 'M') && (matrix[i + 1][j - 1] == 'S')) || ((matrix[i - 1][j + 1] == 'S') && (matrix[i + 1][j - 1] == 'M'))
    (ne_sw and nw_se) ? 1 : 0
end

puts (4..N + 3).map { |i| (4..M + 3).map { |j| look_for_cross_mas(matrix, i, j) } }.flatten.sum
