function spacegroupData = getSpacegroupData(spacegroupNumber)
% GETSPGROUPDATA Returns a mapping of space group numbers to their
% corresponding crystal family letter, centering, and inversion presence.
%
% Input:
%   spacegroupNumber - The number of the space group (1 to 230).
%
% Output:
%   spacegroupData - A cell array {crystalFamily, centering, hasInversion} corresponding to the space group number.

% Create the keys and values for the mapping
keys = num2cell(1:230);  % Space group numbers from 1 to 230

% Define the values array matching the Python data
values = {
    {'a', 'P', false}, ... % 1
    {'a', 'P', true}, ... % 2
    {'m', 'P', false}, ... % 3
    {'m', 'P', false}, ... % 4
    {'m', 'C', false}, ... % 5
    {'m', 'P', false}, ... % 6
    {'m', 'P', false}, ... % 7
    {'m', 'C', false}, ... % 8
    {'m', 'C', false}, ... % 9
    {'m', 'P', true}, ... % 10
    {'m', 'P', true}, ... % 11
    {'m', 'C', true}, ... % 12
    {'m', 'P', true}, ... % 13
    {'m', 'P', true}, ... % 14
    {'m', 'C', true}, ... % 15
    {'o', 'P', false}, ... % 16
    {'o', 'P', false}, ... % 17
    {'o', 'P', false}, ... % 18
    {'o', 'P', false}, ... % 19
    {'o', 'C', false}, ... % 20
    {'o', 'C', false}, ... % 21
    {'o', 'F', false}, ... % 22
    {'o', 'I', false}, ... % 23
    {'o', 'I', false}, ... % 24
    {'o', 'P', false}, ... % 25
    {'o', 'P', false}, ... % 26
    {'o', 'P', false}, ... % 27
    {'o', 'P', false}, ... % 28
    {'o', 'P', false}, ... % 29
    {'o', 'P', false}, ... % 30
    {'o', 'P', false}, ... % 31
    {'o', 'P', false}, ... % 32
    {'o', 'P', false}, ... % 33
    {'o', 'P', false}, ... % 34
    {'o', 'C', false}, ... % 35
    {'o', 'C', false}, ... % 36
    {'o', 'C', false}, ... % 37
    {'o', 'A', false}, ... % 38
    {'o', 'A', false}, ... % 39
    {'o', 'A', false}, ... % 40
    {'o', 'A', false}, ... % 41
    {'o', 'F', false}, ... % 42
    {'o', 'F', false}, ... % 43
    {'o', 'I', false}, ... % 44
    {'o', 'I', false}, ... % 45
    {'o', 'I', false}, ... % 46
    {'o', 'P', true}, ... % 47
    {'o', 'P', true}, ... % 48
    {'o', 'P', true}, ... % 49
    {'o', 'P', true}, ... % 50
    {'o', 'P', true}, ... % 51
    {'o', 'P', true}, ... % 52
    {'o', 'P', true}, ... % 53
    {'o', 'P', true}, ... % 54
    {'o', 'P', true}, ... % 55
    {'o', 'P', true}, ... % 56
    {'o', 'P', true}, ... % 57
    {'o', 'P', true}, ... % 58
    {'o', 'P', true}, ... % 59
    {'o', 'P', true}, ... % 60
    {'o', 'P', true}, ... % 61
    {'o', 'P', true}, ... % 62
    {'o', 'C', true}, ... % 63
    {'o', 'C', true}, ... % 64
    {'o', 'C', true}, ... % 65
    {'o', 'C', true}, ... % 66
    {'o', 'C', true}, ... % 67
    {'o', 'C', true}, ... % 68
    {'o', 'F', true}, ... % 69
    {'o', 'F', true}, ... % 70
    {'o', 'I', true}, ... % 71
    {'o', 'I', true}, ... % 72
    {'o', 'I', true}, ... % 73
    {'o', 'I', true}, ... % 74
    {'t', 'P', false}, ... % 75
    {'t', 'P', false}, ... % 76
    {'t', 'P', false}, ... % 77
    {'t', 'P', false}, ... % 78
    {'t', 'I', false}, ... % 79
    {'t', 'I', false}, ... % 80
    {'t', 'P', false}, ... % 81
    {'t', 'I', false}, ... % 82
    {'t', 'P', true}, ... % 83
    {'t', 'P', true}, ... % 84
    {'t', 'P', true}, ... % 85
    {'t', 'P', true}, ... % 86
    {'t', 'I', true}, ... % 87
    {'t', 'I', true}, ... % 88
    {'t', 'P', false}, ... % 89
    {'t', 'P', false}, ... % 90
    {'t', 'P', false}, ... % 91
    {'t', 'P', false}, ... % 92
    {'t', 'P', false}, ... % 93
    {'t', 'P', false}, ... % 94
    {'t', 'P', false}, ... % 95
    {'t', 'P', false}, ... % 96
    {'t', 'I', false}, ... % 97
    {'t', 'I', false}, ... % 98
    {'t', 'P', false}, ... % 99
    {'t', 'P', false}, ... % 100
    {'t', 'P', false}, ... % 101
    {'t', 'P', false}, ... % 102
    {'t', 'P', false}, ... % 103
    {'t', 'P', false}, ... % 104
    {'t', 'P', false}, ... % 105
    {'t', 'P', false}, ... % 106
    {'t', 'I', false}, ... % 107
    {'t', 'I', false}, ... % 108
    {'t', 'I', false}, ... % 109
    {'t', 'I', false}, ... % 110
    {'t', 'P', false}, ... % 111
    {'t', 'P', false}, ... % 112
    {'t', 'P', false}, ... % 113
    {'t', 'P', false}, ... % 114
    {'t', 'P', false}, ... % 115
    {'t', 'P', false}, ... % 116
    {'t', 'P', false}, ... % 117
    {'t', 'P', false}, ... % 118
    {'t', 'I', false}, ... % 119
    {'t', 'I', false}, ... % 120
    {'t', 'I', false}, ... % 121
    {'t', 'I', false}, ... % 122
    {'t', 'P', true}, ... % 123
    {'t', 'P', true}, ... % 124
    {'t', 'P', true}, ... % 125
    {'t', 'P', true}, ... % 126
    {'t', 'P', true}, ... % 127
    {'t', 'P', true}, ... % 128
    {'t', 'P', true}, ... % 129
    {'t', 'P', true}, ... % 130
    {'t', 'P', true}, ... % 131
    {'t', 'P', true}, ... % 132
    {'t', 'P', true}, ... % 133
    {'t', 'P', true}, ... % 134
    {'t', 'P', true}, ... % 135
    {'t', 'P', true}, ... % 136
    {'t', 'P', true}, ... % 137
    {'t', 'P', true}, ... % 138
    {'t', 'I', true}, ... % 139
    {'t', 'I', true}, ... % 140
    {'t', 'I', true}, ... % 141
    {'t', 'I', true}, ... % 142
    {'h', 'P', false}, ... % 143
    {'h', 'P', false}, ... % 144
    {'h', 'P', false}, ... % 145
    {'h', 'R', false}, ... % 146
    {'h', 'P', true}, ... % 147
    {'h', 'R', true}, ... % 148
    {'h', 'P', false}, ... % 149
    {'h', 'P', false}, ... % 150
    {'h', 'P', false}, ... % 151
    {'h', 'P', false}, ... % 152
    {'h', 'P', false}, ... % 153
    {'h', 'P', false}, ... % 154
    {'h', 'R', false}, ... % 155
    {'h', 'P', false}, ... % 156
    {'h', 'P', false}, ... % 157
    {'h', 'P', false}, ... % 158
    {'h', 'P', false}, ... % 159
    {'h', 'R', false}, ... % 160
    {'h', 'R', false}, ... % 161
    {'h', 'P', true}, ... % 162
    {'h', 'P', true}, ... % 163
    {'h', 'P', true}, ... % 164
    {'h', 'P', true}, ... % 165
    {'h', 'R', true}, ... % 166
    {'h', 'R', true}, ... % 167
    {'h', 'P', false}, ... % 168
    {'h', 'P', false}, ... % 169
    {'h', 'P', false}, ... % 170
    {'h', 'P', false}, ... % 171
    {'h', 'P', false}, ... % 172
    {'h', 'P', false}, ... % 173
    {'h', 'P', false}, ... % 174
    {'h', 'P', true}, ... % 175
    {'h', 'P', true}, ... % 176
    {'h', 'P', false}, ... % 177
    {'h', 'P', false}, ... % 178
    {'h', 'P', false}, ... % 179
    {'h', 'P', false}, ... % 180
    {'h', 'P', false}, ... % 181
    {'h', 'P', false}, ... % 182
    {'h', 'P', false}, ... % 183
    {'h', 'P', false}, ... % 184
    {'h', 'P', false}, ... % 185
    {'h', 'P', false}, ... % 186
    {'h', 'P', false}, ... % 187
    {'h', 'P', false}, ... % 188
    {'h', 'P', false}, ... % 189
    {'h', 'P', false}, ... % 190
    {'h', 'P', true}, ... % 191
    {'h', 'P', true}, ... % 192
    {'h', 'P', true}, ... % 193
    {'h', 'P', true}, ... % 194
    {'c', 'P', false}, ... % 195
    {'c', 'F', false}, ... % 196
    {'c', 'I', false}, ... % 197
    {'c', 'P', false}, ... % 198
    {'c', 'I', false}, ... % 199
    {'c', 'P', true}, ... % 200
    {'c', 'P', true}, ... % 201
    {'c', 'F', true}, ... % 202
    {'c', 'F', true}, ... % 203
    {'c', 'I', true}, ... % 204
    {'c', 'P', true}, ... % 205
    {'c', 'I', true}, ... % 206
    {'c', 'P', false}, ... % 207
    {'c', 'P', false}, ... % 208
    {'c', 'F', false}, ... % 209
    {'c', 'F', false}, ... % 210
    {'c', 'I', false}, ... % 211
    {'c', 'P', false}, ... % 212
    {'c', 'P', false}, ... % 213
    {'c', 'I', false}, ... % 214
    {'c', 'P', false}, ... % 215
    {'c', 'F', false}, ... % 216
    {'c', 'I', false}, ... % 217
    {'c', 'P', false}, ... % 218
    {'c', 'F', false}, ... % 219
    {'c', 'I', false}, ... % 220
    {'c', 'P', true}, ... % 221
    {'c', 'P', true}, ... % 222
    {'c', 'P', true}, ... % 223
    {'c', 'P', true}, ... % 224
    {'c', 'F', true}, ... % 225
    {'c', 'F', true}, ... % 226
    {'c', 'F', true}, ... % 227
    {'c', 'F', true}, ... % 228
    {'c', 'I', true}, ... % 229
    {'c', 'I', true} ... % 230
};

% Now create the containers.Map object
spacegroupDataMap = containers.Map(keys, values);
spacegroupData = spacegroupDataMap(spacegroupNumber);
end