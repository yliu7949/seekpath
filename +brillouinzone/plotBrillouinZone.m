function plotBrillouinZone(b1, b2, b3)
%PLOTBRILLOUINZONE Plot the Brillouin zone given three reciprocal lattice vectors.
%
% This function computes the Brillouin zone using the provided reciprocal lattice vectors
% and then plots the zone's structure, showing its vertices and faces.
%
% Input:
%   b1, b2, b3  - The three reciprocal lattice vectors (1x3 vectors) that define the reciprocal lattice.
%
% This function calls `brillouinzone.getBrillouinZone` to compute the vertices and faces of the Brillouin zone
% and visualizes the result.

% Compute the faces of the Brillouin zone
facesData = brillouinzone.getBrillouinZone(b1, b2, b3);

% Display information about the faces
faces = facesData.faces;
facesCount = containers.Map('KeyType', 'int32', 'ValueType', 'int32');
for i = 1:length(faces)
    numSides = length(faces{i});
    if isKey(facesCount, numSides)
        facesCount(numSides) = facesCount(numSides) + 1;
    else
        facesCount(numSides) = 1;
    end
end

% Plot the Brillouin zone
figure;
hold on;
axis equal;
view(3);
xlabel('X');
ylabel('Y');
zlabel('Z');
set(gca, 'Visible', 'off');

% Global list of vertices
vertices = facesData.vertices;

% Draw the faces of the Brillouin zone
for i = 1:length(faces)
    faceIndices = faces{i};  % Indices of face vertices in the global vertices list
    % Use the global vertices list to draw the face
    patch('Faces', faceIndices, 'Vertices', vertices, ...
        'FaceColor', '#A1BEFF', 'EdgeColor', 'k', ...
        'FaceAlpha', 0.8, 'LineWidth', 1);
end

% Plot the origin
scatter3(0, 0, 0, 100, 'g', 'filled');

% Draw coordinate axes arrows
axesLength = max(sqrt(sum(vertices.^2, 2))) * 1.5;
quiver3(0, 0, 0, axesLength, 0, 0, 'k', 'LineWidth', 2, 'MaxHeadSize', 0.2);
quiver3(0, 0, 0, 0, axesLength, 0, 'k', 'LineWidth', 2, 'MaxHeadSize', 0.2);
quiver3(0, 0, 0, 0, 0, axesLength, 'k', 'LineWidth', 2, 'MaxHeadSize', 0.2);

% Add labels to axes b1, b2, b3
text(axesLength, 0, 0, 'b_1', 'FontSize', 12, 'FontWeight', 'bold');
text(0, axesLength, 0, 'b_2', 'FontSize', 12, 'FontWeight', 'bold');
text(0, 0, axesLength, 'b_3', 'FontSize', 12, 'FontWeight', 'bold');

hold off;

% Set the view angle
direction = b1 + b2 + b3; 
if norm(direction) < 1e-10
    direction = [1, 1, 1];
end
direction = direction / norm(direction);

R = angle2dcm(deg2rad(25), deg2rad(35), 0, 'ZXY');
direction = (R * direction(:))';
campos(direction * axesLength);
rotate3d(gcf, 'on');
end
