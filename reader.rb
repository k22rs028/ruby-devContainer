# reader.rb

f = File.open "reader.rb", "r"

while line = f.gets()
  puts line
end

f.close
