classdef SpglibError < int64
    enumeration
        SPGLIB_SUCCESS (0)
        SPGERR_SPACEGROUP_SEARCH_FAILED (1)
        SPGERR_CELL_STANDARDIZATION_FAILED (2)
        SPGERR_SYMMETRY_OPERATION_SEARCH_FAILED (3)
        SPGERR_ATOMS_TOO_CLOSE (4)
        SPGERR_POINTGROUP_NOT_FOUND (5)
        SPGERR_NIGGLI_FAILED (6)
        SPGERR_DELAUNAY_FAILED (7)
        SPGERR_ARRAY_SIZE_SHORTAGE (8)
        SPGERR_NONE (9)
    end
end
