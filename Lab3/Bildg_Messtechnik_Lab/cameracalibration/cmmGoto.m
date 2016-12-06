function [ ret_val ] = cmmGoto( X, cmm_time_out, dest_ip, dest_port )
%CMMGOTO send a GOTO command to the CMM.
% IN:   - X         The absolute position in the CMM reference frame
%       - wait      (optional) The timeout between the command was sent and
%                   the port is closed. This timeout ensures that the CMM
%                   reached the goal position. The default value is 0.3
%                   seconds.
%       - dest_ip   (optional ) The IP- address of the CMM control computer.
%                   If no address is provided, the default address
%                   ('192.168.2.233') is used.
%       - dest_port (optional) The destination port of the CMM control
%                   computer. If no port is provided, the default port
%                   (1500) is used.

if( nargin < 4 ); dest_port    = 1500;            end;
if( nargin < 3 ); dest_ip      = '192.168.2.233'; end;
if( nargin < 2 ); cmm_time_out = 30;             end;
X = X(:);
if( size(X,1) ~= 3 || size(X,2) ~=1 )
    warning('Wrong position format. The position must be a vector with three elements.')
    ret_val = 1;
    return;
end
if( X(1) > 0 || X(2) > 0 || X(3) > 0 )
    warning('The position is not reachable. Check the sign of each element.');
    ret_val = 1;
    return;
end

%t=tcpip(dest_ip,dest_port,'NetworkRole','client');
% t=tcpip(dest_ip,dest_port);
% fopen(t);
c = ['GOTO:goto/', num2str(X(1)) ',' num2str(X(2)) ',' num2str(X(3)),' '];
% fprintf(t,'%s',c);
% fclose(t);
sockSendReceive(dest_ip,dest_port,c);

% check, if CMM is still moving;
% The CMM closes the connection after it receiving a data-package. So open
% the connection after every command that was sent!
moving = true;
tstart = tic;
while moving == true
    pause(0.2);
%     fopen(t);
    c = 'CMD:getmachinestatus ';
%     fprintf(t,'%s',c);
%     ret_val = fread(t,1,'uchar');
%     fclose(t);
    ret_val = sockSendReceive(dest_ip,dest_port,c);
    if(strcmp(ret_val,'Still'))
    	moving = false;
    end    
    telapsed = toc(tstart);
    if telapsed > cmm_time_out
        warning('CMM timeout');
        ret_val = 1;
        break;
    end
    ret_val = 0;
end

end

