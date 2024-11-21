function [PMatrix, inversePMatrix] = getPMatrix(bravaisLatticeType)
%GETPMATRIX Returns the P matrix and its inverse for a given Bravais lattice.
%
%   [PMatrix, inversePMatrix] = getPMatrix(bravaisLatticeType)
%
% Parameters:
%   bravaisLatticeType: A string representing the Bravais lattice type (e.g., 'cP', 'tP', etc.).
%
% Returns:
%   PMatrix: The 3x3 matrix that converts conventional lattice vectors to primitive lattice vectors.
%   inversePMatrix: The inverse of PMatrix, used for coordinate transformation.

    if any(strcmp(bravaisLatticeType, {'cP', 'tP', 'hP', 'oP', 'mP'}))
        PMatrix = [1, 0, 0; 0, 1, 0; 0, 0, 1];
        inversePMatrix = [1, 0, 0; 0, 1, 0; 0, 0, 1];
    elseif any(strcmp(bravaisLatticeType, {'cF', 'oF'}))
        PMatrix = 1.0 / 2.0 * [0, 1, 1; 1, 0, 1; 1, 1, 0];
        inversePMatrix = [-1, 1, 1; 1, -1, 1; 1, 1, -1];
    elseif any(strcmp(bravaisLatticeType, {'cI', 'tI', 'oI'}))
        PMatrix = 1.0 / 2.0 * [-1, 1, 1; 1, -1, 1; 1, 1, -1];
        inversePMatrix = [0, 1, 1; 1, 0, 1; 1, 1, 0];
    elseif strcmp(bravaisLatticeType, 'hR')
        PMatrix = 1.0 / 3.0 * [2, -1, -1; 1, 1, -2; 1, 1, 1];
        inversePMatrix = [1, 0, 1; -1, 1, 1; 0, -1, 1];
    elseif strcmp(bravaisLatticeType, 'oC')
        PMatrix = 1.0 / 2.0 * [1, 1, 0; -1, 1, 0; 0, 0, 2];
        inversePMatrix = [1, -1, 0; 1, 1, 0; 0, 0, 1];
    elseif strcmp(bravaisLatticeType, 'oA')
        PMatrix = 1.0 / 2.0 * [0, 0, 2; 1, 1, 0; -1, 1, 0];
        inversePMatrix = [0, 1, -1; 0, 1, 1; 1, 0, 0];
    elseif strcmp(bravaisLatticeType, 'mC')
        PMatrix = 1.0 / 2.0 * [1, -1, 0; 1, 1, 0; 0, 0, 2];
        inversePMatrix = [1, 1, 0; -1, 1, 0; 0, 0, 1];
    elseif strcmp(bravaisLatticeType, 'aP')
        % For aP, the primitive cell is already obtained
        PMatrix = [1, 0, 0; 0, 1, 0; 0, 0, 1];
        inversePMatrix = [1, 0, 0; 0, 1, 0; 0, 0, 1];
    else
        error('Invalid Bravais lattice type: %s', bravaisLatticeType);
    end
end
