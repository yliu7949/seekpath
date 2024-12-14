function [POSCAR_inversion, POSCAR_noinversion] = getStructureData(extendedBravais)
%GETSTRUCTUREDATA Retrieve POSCAR_inversion and POSCAR_noinversion for an extended Bravais lattice.
%
% This function fetches structural data for the specified extended Bravais lattice symbol
% from the `BandPathData.mat` file. If the file is not available, it automatically
% triggers data generation using the `data.generateBandPathData` function.
%
% Input:
%   extendedBravais - A string specifying the extended Bravais lattice symbol (e.g., 'cF1').
%
% Output:
%   POSCAR_inversion    - A cell array containing the POSCAR data with inversion symmetry.
%   POSCAR_noinversion  - A cell array containing the POSCAR data without inversion symmetry.

% Define the path to the BandPathData.mat file
bandPathDataFilePath = fullfile('+seekpath', '+data', 'BandPathData.mat');

% Check if the BandPathData.mat file exists
if ~isfile(bandPathDataFilePath)
    fprintf('BandPathData.mat not found. Generating it...\n');
    seekpath.data.generateBandPathData();  % Generate the data if the file does not exist
end

% Load the BandPathData.mat file
loadedData = load(bandPathDataFilePath, 'bandPathData');
bandPathData = loadedData.bandPathData;

% Check if the requested Bravais lattice exists in the data
if ~isfield(bandPathData, extendedBravais)
    error('Bravais lattice "%s" not found in the BandPathData.', extendedBravais);
end

% Extract the data for the specified Bravais lattice
latticeData = bandPathData.(extendedBravais);

if ~isfield(latticeData, 'POSCAR_inversion')
    latticeData.POSCAR_inversion = [];
end

if ~isfield(latticeData, 'POSCAR_noinversion')
    latticeData.POSCAR_noinversion = [];
end

POSCAR_inversion = latticeData.POSCAR_inversion;
POSCAR_noinversion = latticeData.POSCAR_noinversion;
end

