function plotBrillouinZoneWithPath(b1, b2, b3, result)
%PLOTBRILLOUINZONEWITHPATH Plot the Brillouin zone with path line segments and labels.
%
% This function computes the Brillouin zone using the provided reciprocal lattice vectors
% and then plots the zone's structure, showing its vertices and faces.
% Additionally, it adds path line segments between specified points in red color,
% labels the axes, points (using Greek letters where specified), and adjusts visual properties as per the user's request.
%
% Input:
% b1, b2, b3 - The three reciprocal lattice vectors (1x3 vectors) that define the reciprocal lattice.
% result - A struct containing the path and point coordinates.
%          result.path is an nx2 cell array of point identifiers.
%          result.point_coords.(p1) gives the coordinates of point p1.
%
% This function calls `brillouinzone.getBrillouinZone` to compute the vertices and faces of the Brillouin zone
% and visualizes the result along with the specified path.

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

% Draw the faces of the Brillouin zone with face color 'none'
for i = 1:length(faces)
    faceIndices = faces{i}; % Indices of face vertices in the global vertices list
    % Use the global vertices list to draw the face
    patch('Faces', faceIndices, 'Vertices', vertices, ...
        'FaceColor', '#A1BEFF', 'EdgeColor', 'k', ...
        'FaceAlpha', 0.4, 'LineWidth', 1);
end

% Plot the origin with larger size and more noticeable
scatter3(0, 0, 0, 100, 'g', 'filled');

% Draw coordinate axes arrows and label them
axesLength = 2;
quiver3(0, 0, 0, axesLength, 0, 0, 'k', 'LineWidth', 2, 'MaxHeadSize', 0.2);
quiver3(0, 0, 0, 0, axesLength, 0, 'k', 'LineWidth', 2, 'MaxHeadSize', 0.2);
quiver3(0, 0, 0, 0, 0, axesLength, 'k', 'LineWidth', 2, 'MaxHeadSize', 0.2);

% Add labels to axes b1, b2, b3
text(axesLength, 0, 0, 'b_1', 'FontSize', 12, 'FontWeight', 'bold');
text(0, axesLength, 0, 'b_2', 'FontSize', 12, 'FontWeight', 'bold');
text(0, 0, axesLength, 'b_3', 'FontSize', 12, 'FontWeight', 'bold');

% Plot the path line segments between points using red color
% Also plot the points themselves with larger size and label them
plottedPoints = struct(); % To keep track of points already plotted

for i = 1:size(result.path, 1)
    p1 = result.path{i, 1};
    p2 = result.path{i, 2};
    coord1 = result.point_coords.(p1);
    coord2 = result.point_coords.(p2);
    % Plot a line between coord1 and coord2
    line([coord1(1), coord2(1)], [coord1(2), coord2(2)], [coord1(3), coord2(3)], ...
        'Color', 'r', 'LineWidth', 2);

    % Plot the points if not already plotted
    if ~isfield(plottedPoints, p1)
        scatter3(coord1(1), coord1(2), coord1(3), 70, 'r', 'filled');
        % Replace 'Gamma' with Greek letter gamma
        if strcmpi(p1, 'Gamma')
            label_p1 = '\Gamma';
        else
            label_p1 = p1;
        end
        text(coord1(1), coord1(2), coord1(3), ['  ', label_p1], 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Interpreter', 'tex');
        plottedPoints.(p1) = true;
    end
    if ~isfield(plottedPoints, p2)
        scatter3(coord2(1), coord2(2), coord2(3), 70, 'r', 'filled');
        % Replace 'Gamma' with Greek letter gamma
        if strcmpi(p2, 'Gamma')
            label_p2 = '\Gamma';
        else
            label_p2 = p2;
        end
        text(coord2(1), coord2(2), coord2(3), ['  ', label_p2], 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'k', 'Interpreter', 'tex');
        plottedPoints.(p2) = true;
    end
end

% Set the view angle
view(60, 0);
hold off;
end
