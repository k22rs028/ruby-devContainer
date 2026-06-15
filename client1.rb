#! /usr/local/bin/ruby
# client1.rb

require 'socket'

host = 'www.is.kyusan-u.ac.jp'
port = 80
path = '/~toshi/'

sock = TCPSocket.new host, port
cmd = 'GET ' + path + " HTTP/1.0\r\n\r\n"
pp cmd
sock.puts cmd


# line = sock.gets
# puts line

while line = sock.gets
  puts line
end