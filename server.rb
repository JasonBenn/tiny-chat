require 'pry'
require 'socket'

port = (ARGV[0] || 80).to_i
server = TCPServer.new('0.0.0.0', port)

while (session = server.accept)
  puts "Request: #{session.gets}"
  session.print "HTTP/1.1 200/OK\r\nContent-type: text/html\r\n\r\n"
  session.print File.read('./page.html')
  session.close
end
