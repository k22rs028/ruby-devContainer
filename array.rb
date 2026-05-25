ia = [1, 3, 5]
sa = Array.new
sa[0] = "Java"
sa[1] = "Python"
sa[2] = "Ruby"

i = 0
while i < ia.length
  print ia[i].to_s + ","
  i += 1
end

puts

ia.each do |i|
  print i.to_s + "," 
end

puts

xa = [1, 3.5, "Ruby", 5, [3,5]]
xa.each_with_index do |i, idx|
  p [i, idx]
end

z = [3, 5, 10, 7, 2, -2]
zs = z.sort
p z
p zs

zm = z.max
zsum = z.sum
zmin = z.min

puts zm
puts zsum
puts zmin


