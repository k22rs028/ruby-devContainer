#! /usr/local/bin/ruby
# server1.rb

require 'socket'

def server s
  cmd, path, ver = s.gets.split " "
  pp cmd, path, ver
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
    tpath = path.gsub("/api/culc/", "")
    tpath = tpath.gsub("%20", "")
    cul = culculate tpath
    s.puts "{"
    s.puts '"result": "' + "#{cul}" + '"'
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

def culculate tpath
  if tpath.match?(/\A\d+(?:\.\d+)?(\s*[+\-*\/]\s*\d+(?:\.\d+)?)*\z/)
    begin
      result = eval(tpath)
    rescue ZeroDivisionError
      result = "error: division by zero"
    end
  else
    result = "error"
  end
  return result
end

gs = TCPServer.open 'http'

loop do
  pp "start accept"
  s = gs.accept
  Thread.new do
    server s
  end
end
