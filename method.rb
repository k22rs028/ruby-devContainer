def max(x, y)
  if x > y
    return x
  else
    return y
  end
end

# 同上
=begin
def max(x, y)
  if x > y
    x
  else
    y
  end
  # ここにxやyを置くと、最後に評価された値が返される
  # returnを書くとここに何を置いても無視される
end
=end

puts max 5, 10
puts max -3, -2

x = if 5 < 3
  "five"
else
  "three"
end

puts x
