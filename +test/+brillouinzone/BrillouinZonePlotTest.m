classdef BrillouinZonePlotTest < matlab.unittest.TestCase
    methods(Test)
        function SCLatticeTest(~)
            % For Simple Cubic (SC) lattice.
            b1 = [1, 0, 0];
            b2 = [0, 1, 0];
            b3 = [0, 0, 1];
            brillouinzone.plotBrillouinZone(b1, b2, b3);
        end

        function BCCLatticeTest(~)
            % For Body-Centered Cubic (BCC) lattice.
            b1 = [1, 1, 0];
            b2 = [1, 0, 1];
            b3 = [0, 1, 1];
            brillouinzone.plotBrillouinZone(b1, b2, b3);
        end

        function FCCLatticeTest(~)
            % For Face-Centered Cubic (FCC) lattice.
            b1 = [1, 1, -1];
            b2 = [1, -1, 1];
            b3 = [-1, 1, 1];
            brillouinzone.plotBrillouinZone(b1, b2, b3);
        end

        function CustomLatticeTest(~)
            b1 = [1, 0, 0];
            b2 = [0, 1, 0];
            b3 = [0.2, 0.2, 1];
            brillouinzone.plotBrillouinZone(b1, b2, b3);
        end

        function Si8PlotWithPathTest(~)
            cell = [
                5.4437023729394527    0.0000000000000000    0.0000000000000003
                0.0000000000000009    5.4437023729394527    0.0000000000000003
                0.0000000000000000    0.0000000000000000    5.4437023729394527
                ];
            positions = [
                0.7500000000000000    0.7500000000000000    0.2500000000000000
                0.0000000000000000    0.5000000000000000    0.5000000000000000
                0.7500000000000000    0.2500000000000000    0.7500000000000000
                0.0000000000000000    0.0000000000000000    0.0000000000000000
                0.2500000000000000    0.7500000000000000    0.7500000000000000
                0.5000000000000000    0.5000000000000000    0.0000000000000000
                0.2500000000000000    0.2500000000000000    0.2500000000000000
                0.5000000000000000    0.0000000000000000    0.5000000000000000
                ];
            numbers = 14 * ones(1, 8);
            structure = {cell, positions, numbers};

            result = hpkot.getPath(structure, false);
            reciprocalLattice = utils.getReciprocalCellRows(result.primitive_lattice);
            b1 = reciprocalLattice(:, 1);
            b2 = reciprocalLattice(:, 2);
            b3 = reciprocalLattice(:, 3);

            % Call the function to plot
            brillouinzone.plotBrillouinZoneWithPath(b1, b2, b3, result);
        end
    end
end