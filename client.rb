#! /usr/local/bin/ruby
# client1.rb

require 'socket'

# http://www.is.kyusan-u.ac.jp/
# http://localhost/api/culc/

host = ARGV[0]
port = 'http'
path = ARGV[1]
if path == nil
  path = '/'
end


sock = TCPSocket.new host, port
cmd  = "GET #{path} HTTP/1.1\r\n"
cmd += "Host: #{host}\r\n"
cmd += "Connection: close\r\n"
cmd += "\r\n"
pp cmd
sock.print cmd

body = ""
is_body = false
while line = sock.gets
#  pp line
  body += line if is_body
  is_body = true if line == "\r\n"
end

if path.start_with?("/api/culc/")
  if body =~ /"result":\s*"([^"]*)"/
    result = $1
    tpath = path.sub("/api/culc/", "")
    puts "#{tpath} = #{result}"
  else
    puts body
  end
else
  print body
end
