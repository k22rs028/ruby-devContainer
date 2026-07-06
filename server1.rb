#! /usr/local/bin/ruby
# server1.rb

require 'socket'

def server s
  cmd, path , ver = s.gets.split " "
  # HTTP/1.1として正しく返答
  # 1行目 HTTP/1.0 200 OK
  # 2行目 Content-Type text/html
  # 3行目 空行
  # 4行目 コンテンツ
  # 最後 ソケットをクローズ
  if path == "/"
    s.puts "HTTP/1.0 200 OK\r\n"
    s.puts "Content-Type: text/html\r\n"
    s.puts "\r\n"
    pp "INDEX"
    s.puts "<s>index</s>"
  else
    pp path
    s.puts "other"
  end
  s.close
end

gs = TCPServer.open 'http'
loop do
  pp "start accept"
  s = gs.accept

  Thread.new do
    server s
    sleep 10
  end
end