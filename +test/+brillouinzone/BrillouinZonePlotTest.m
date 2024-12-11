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

        function HexagonalLatticeTest(~)
            % For Hexagonal lattice.
            b1 = [1/2, -sqrt(3)/2, 0];
            b2 = [1/2, sqrt(3)/2, 0];
            b3 = [0, 0, 1];
            brillouinzone.plotBrillouinZone(b1, b2, b3);
        end

        function CustomLatticeTest(~)
            b1 = [1, 0, 0];
            b2 = [0, 1, 0];
            b3 = [0.2, 0.2, 1];
            brillouinzone.plotBrillouinZone(b1, b2, b3);
        end

        function RectangularLattice2DTest(~)
            % For 2D Rectangular Lattice.
            b1 = [2*pi, 0];
            b2 = [0, 2*pi/2];
            brillouinzone.plotBrillouinZone(b1, b2);
        end

        function ObliqueLattice2DTest(~)
            % For 2D Oblique Lattice.
            theta = pi/4;
            b1 = [2*pi, 0];
            b2 = [2*pi*1.7*cos(theta), 2*pi*1.7*sin(theta)];
            brillouinzone.plotBrillouinZone(b1, b2);
        end

        function HexagonalLattice2DTest(~)
            % For 2D Hexagonal Lattice.
            b1 = [0.5, sqrt(3)/2];
            b2 = [1, 0];
            brillouinzone.plotBrillouinZone(b1, b2);
        end

        function CustomLattice2DTest(~)
            b1 = [0.3, sqrt(3)/2];
            b2 = [1, 0];
            brillouinzone.plotBrillouinZone(b1, b2);
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
