function [ ret ] = sockSendReceive( ip, port, out_str, timeout )
%SOCKSENDRECIEV send a string and receive the return value.
% IN:   ip          - host IP
%       port        - host port
%       out_str     - string to send
%       timeout     - (otional) the timeout in ms for the socket connection
%                     the default value is 5000 ms.
%
% OUT:  ret         - return value from the host
import java.net.Socket
import java.net.InetSocketAddress
import java.io.*

if nargin <= 3
    timeout = 5000;
end

% sock = Socket(ip, port);
inet_adr = InetSocketAddress(ip, port);
sock = Socket;
sock.connect(inet_adr, timeout);
out_stream = sock.getOutputStream;
out_writer = PrintWriter(out_stream, true);
out_writer.printf('%s',out_str);
% out_writer.println(out_str);
% out_writer.print(out_str);
in_stream = sock.getInputStream;
in_stream_reader = InputStreamReader(in_stream);
in_reader = BufferedReader(in_stream_reader);
ret = in_reader.readLine;

sock.close;
end

