#! /usr/local/bin/ruby
# client1.rb

require 'socket'

host = 'www.is.kyusan-u.ac.jp'
port = 80
path = '/~toshi/'

sock = TCPSocket.new host, port
#cmd = 'GET ' + path + " HTTP/1.1\r\n" + "Host: " + host + "\r\n\r\n"
cmd = "GET #{path} HTTP/1.1\r\nHost: #{host}\r\nConnection: close\r\n\r\n"
pp cmd
sock.puts cmd

is_body = false
while line = sock.gets
  # pp line
  puts line if is_body
  is_body = true if line == "\r\n"
end

# line = sock.gets
# puts line
#is_body = false
#while line = sock.gets
# pp line
#  if line.start_with? ('<!DOCTYPE')
#    is_body = true
#  end
#  if is_body
#    puts line
#  end
#end