function rotM = rotation_matrix(rr,order)

%reorder angles
oo = order - 'X' + 1; % 'X' -> 1, 'Y' -> 2, 'Z' -> 3
reord = [find(order=='X'),find(order=='Y'),find(order=='Z')];

%Find the cos/sin of each angle about each axis
c = cos(rr(reord));
s = sin(rr(reord));
%create rotation matricies
RxRyRz(:,:,1) = [1 0 0; 0 c(1) -s(1); 0 s(1) c(1)]; %Rotation about x axis
RxRyRz(:,:,2) = [c(2) 0 s(2); 0 1 0; -s(2) 0 c(2)]; %Rotation about y axis
RxRyRz(:,:,3) = [c(3) -s(3) 0; s(3) c(3) 0; 0 0 1]; %Rotation about z axis
%Using the specified order, assemble the rotation matrix
rotM = RxRyRz(:,:,oo(1))*RxRyRz(:,:,oo(2))*RxRyRz(:,:,oo(3));

end

% License included in README.