#! /usr/local/bin/ruby
# server1.rb

require 'socket'

gs = TCPServer.open 'http'
loop do
  pp "start accept"
  s = gs.accept

  while line = s.gets
    pp line
    s.puts line
    break if line == "\r\n"
  end
  s.close
  sleep 1
end