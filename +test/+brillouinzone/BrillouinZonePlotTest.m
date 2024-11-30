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
    end
end