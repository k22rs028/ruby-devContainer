#! /usr/bin/env ruby

puts "Hello, World!"
puts("Hello, World!")

a = 5
s = "Ruby"
d = 3.14

puts a
puts s
puts d



# 型変更可能
a = "String"
puts a

puts "a:"+a.to_s
puts "a:#{a}"

x = 5
while(x > 0) do
  print x
  x -= 1
end

puts ""

5.times do |i|
  print i.to_s + ","
end