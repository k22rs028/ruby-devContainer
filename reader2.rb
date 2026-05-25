# reader2.rb

File.open(ARGV[0], "r") do |f|
  while line = f.gets()
    puts line
  end
end