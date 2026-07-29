#! /usr/local/bin/ruby
# server1.rb

require 'socket'

def server s
  cmd, path, ver = s.gets.split " "
  # HTTP/1.0 として返答
  # 1行目 HTTP/1.0 200 OK
  # 2行目 Content-Type: text/html
  # 3行目 空行
  # 4行目　コンテンツ
  # 最後　ソケットをクローズ
  if path == "/"
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: text/html\r\n"
    s.print "\r\n"
    pp "INDEX"
    s.puts "<h1>index</h1>"
  elsif path == "/api/now"
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: application/json\r\n"
    s.print "\r\n"
    s.puts "{"
    s.puts '"time": "' + "#{Time.now}" + '"'
    s.puts "}"
  # 完全一致はダメelsif path == "/api/culc/"
  elsif path.start_with? "/api/culc/"
    s.print "HTTP/1.0 200 OK\r\n"
    s.print "Content-Type: application/json\r\n"
    s.print "\r\n"
    s.puts "culculate"
    s.puts "{"
    s.puts '"result": "' + "#{culculate path}" + '"'
    s.puts "}"
  else
    file=path.slice 1..-1
    if File.exist? file
      s.print "HTTP/1.0 200 OK\r\n"
      s.print "Content-Type: text/plain; charset=UTF-8\r\n"
      s.print "\r\n"
      File.open(file, "r") do |f|
        while line = f.gets
          s.puts line
        end
      end
    else
      s.print "HTTP/1.0 404 NotFound\r\n"
      s.print "Content-Type: text/html\r\n"
      s.print "\r\n"
      s.puts "<h1>File "+path+" not found</h1>"
      s.puts "<p>File not found</p>"
    end

  end
  s.close
end

def culculate path
  path.slice! "/api/culc/"
  path.slice! "?"
  params = path.split "&"
  params.each do |param|
    key, value = param.split "="
    if key == "a"
      a = value.to_i
    elsif key == "b"
      b = value.to_i
    elsif key == "op"
      op = value
    end
  end
  if op == "+"
    return a + b
  elsif op == "-"
    return a - b
  elsif op == "*"
    return a * b
  elsif op == "/"
    return a / b
  else
    return "unknown operator"
  end

end

gs = TCPServer.open 'http'

loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
  end
end
