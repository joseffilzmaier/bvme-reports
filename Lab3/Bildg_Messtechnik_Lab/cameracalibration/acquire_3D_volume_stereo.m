% this script samples a 3D volume in a form of a cubic.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SETTINGS FOR Canon EOS350D;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% center of the front face of the cube:
v_c = [-220.4,-288.0,-201.4]; % approx Z-distance to cam = 50cm

% size of the cube:
v_x = 300;            % depth of the cube
v_y = 519.5;          % width of the cube
v_z = 324;            % height of the cube

N_points = 10;

% use this sampled point only in the case that the target was detected in
% the image.
x_a = v_c(1)-v_x;
x_b = v_c(1);
PT = round([x_a + (x_b-x_a).*rand(1,N_points)
            (v_c(2)-v_y/2)+((v_c(2)+v_y/2)-(v_c(2)-v_y/2)).*rand(1,N_points)
            (v_c(3)-v_z/2)+((v_c(3)+v_z/2)-(v_c(3)-v_z/2)).*rand(1,N_points)]);

N = size(PT,2);
plot3(PT(1,:), PT(2,:), PT(3,:), '.'); axis equal;
xlabel('cmm_X'); ylabel('cmm_Y'); zlabel('cmm_Z'); 


% aquire images:
dest_ip_cmm   = '192.168.2.233';
dest_port_cmm = 1500;

canon_dest_ip = '192.168.0.93';
canon_dest_port = 9999;

cmmGoto( v_c, 120, dest_ip_cmm, dest_port_cmm );
% workaround to wake up the camera from standby
sockSendReceive(canon_dest_ip,canon_dest_port,'S');

for i=1:N
    fprintf('pt %d / %d \n', i,N);
    cmmGoto( PT(:,i), 120, dest_ip_cmm, dest_port_cmm );
    pause(1);
    % take image...
    ret_val = sockSendReceive(canon_dest_ip,canon_dest_port,'S');
    pause(3);
    if ret_val ~= 'D'
        error('Connection failed');
    end    
end
save('wrld_point_coords.mat', 'PT')
a = clock;
save(['wrld_point_coords' ... 
      num2str(a(1))...
      num2str(a(2))...
      num2str(a(3))...
      num2str(a(4))...
      num2str(a(5))...
      '.mat'], 'PT')

