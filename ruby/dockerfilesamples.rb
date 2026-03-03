require "socket"

server = TCPServer.new("0.0.0.0", 8080)
puts "Listening on :8080"

loop do
  client = server.accept
  client.puts "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Dockerfile Samples!"
  client.close
end
