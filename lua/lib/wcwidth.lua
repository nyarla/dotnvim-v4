-- this data makes from https://github.com/hamano/locale-eaw
local M = {
  { 0xa1, 0xa1, 1 },
  { 0xa4, 0xa4, 1 },
  { 0xa7, 0xa8, 1 },
  { 0xaa, 0xaa, 1 },
  { 0xad, 0xae, 1 },
  { 0xb0, 0xb4, 1 },
  { 0xb6, 0xba, 1 },
  { 0xbc, 0xbf, 1 },
  { 0xc6, 0xc6, 1 },
  { 0xd0, 0xd0, 1 },
  { 0xd7, 0xd8, 1 },
  { 0xde, 0xe1, 1 },
  { 0xe6, 0xe6, 1 },
  { 0xe8, 0xea, 1 },
  { 0xec, 0xed, 1 },
  { 0xf0, 0xf0, 1 },
  { 0xf2, 0xf3, 1 },
  { 0xf7, 0xfa, 1 },
  { 0xfc, 0xfc, 1 },
  { 0xfe, 0xfe, 1 },
  { 0x101, 0x101, 1 },
  { 0x111, 0x111, 1 },
  { 0x113, 0x113, 1 },
  { 0x11b, 0x11b, 1 },
  { 0x126, 0x127, 1 },
  { 0x12b, 0x12b, 1 },
  { 0x131, 0x133, 1 },
  { 0x138, 0x138, 1 },
  { 0x13f, 0x142, 1 },
  { 0x144, 0x144, 1 },
  { 0x148, 0x14b, 1 },
  { 0x14d, 0x14d, 1 },
  { 0x152, 0x153, 1 },
  { 0x166, 0x167, 1 },
  { 0x16b, 0x16b, 1 },
  { 0x1ce, 0x1ce, 1 },
  { 0x1d0, 0x1d0, 1 },
  { 0x1d2, 0x1d2, 1 },
  { 0x1d4, 0x1d4, 1 },
  { 0x1d6, 0x1d6, 1 },
  { 0x1d8, 0x1d8, 1 },
  { 0x1da, 0x1da, 1 },
  { 0x1dc, 0x1dc, 1 },
  { 0x251, 0x251, 1 },
  { 0x261, 0x261, 1 },
  { 0x2c4, 0x2c4, 1 },
  { 0x2c7, 0x2c7, 1 },
  { 0x2c9, 0x2cb, 1 },
  { 0x2cd, 0x2cd, 1 },
  { 0x2d0, 0x2d0, 1 },
  { 0x2d8, 0x2db, 1 },
  { 0x2dd, 0x2dd, 1 },
  { 0x2df, 0x2df, 1 },
  { 0x391, 0x3a1, 1 },
  { 0x3a3, 0x3a9, 1 },
  { 0x3b1, 0x3c1, 1 },
  { 0x3c3, 0x3c9, 1 },
  { 0x401, 0x401, 1 },
  { 0x410, 0x44f, 1 },
  { 0x451, 0x451, 1 },
  { 0x2010, 0x2010, 1 },
  { 0x2013, 0x2016, 1 },
  { 0x2018, 0x2019, 1 },
  { 0x201c, 0x201d, 1 },
  { 0x2020, 0x2022, 1 },
  { 0x2024, 0x2027, 1 },
  { 0x2030, 0x2031, 2 },
  { 0x2032, 0x2033, 1 },
  { 0x2035, 0x2035, 1 },
  { 0x203b, 0x203b, 2 },
  { 0x203e, 0x203e, 1 },
  { 0x2074, 0x2074, 1 },
  { 0x207f, 0x207f, 1 },
  { 0x2081, 0x2084, 1 },
  { 0x20ac, 0x20ac, 1 },
  { 0x2103, 0x2103, 1 },
  { 0x2105, 0x2105, 1 },
  { 0x2109, 0x2109, 1 },
  { 0x2113, 0x2113, 1 },
  { 0x2116, 0x2116, 1 },
  { 0x2121, 0x2121, 2 },
  { 0x2122, 0x2122, 1 },
  { 0x2126, 0x2126, 1 },
  { 0x212b, 0x212b, 1 },
  { 0x213b, 0x213b, 2 },
  { 0x214f, 0x214f, 2 },
  { 0x2153, 0x2154, 1 },
  { 0x215b, 0x215e, 1 },
  { 0x2160, 0x2182, 2 },
  { 0x2189, 0x2189, 1 },
  { 0x2190, 0x21ff, 2 },
  { 0x2200, 0x2200, 1 },
  { 0x2202, 0x2203, 1 },
  { 0x2207, 0x2208, 1 },
  { 0x220b, 0x220b, 1 },
  { 0x220f, 0x220f, 1 },
  { 0x2211, 0x2211, 1 },
  { 0x2215, 0x2215, 1 },
  { 0x221a, 0x221a, 1 },
  { 0x221d, 0x2220, 1 },
  { 0x2223, 0x2223, 1 },
  { 0x2225, 0x2225, 1 },
  { 0x2227, 0x222c, 1 },
  { 0x222e, 0x222e, 1 },
  { 0x2234, 0x2237, 1 },
  { 0x223c, 0x223d, 1 },
  { 0x2248, 0x2248, 1 },
  { 0x224c, 0x224c, 1 },
  { 0x2252, 0x2252, 1 },
  { 0x2260, 0x2261, 1 },
  { 0x2264, 0x2267, 1 },
  { 0x226a, 0x226b, 1 },
  { 0x226e, 0x226f, 1 },
  { 0x2282, 0x2283, 1 },
  { 0x2286, 0x2287, 1 },
  { 0x2295, 0x2295, 1 },
  { 0x2299, 0x2299, 1 },
  { 0x22a5, 0x22a5, 1 },
  { 0x22bf, 0x22bf, 1 },
  { 0x2312, 0x2312, 1 },
  { 0x2318, 0x2318, 2 },
  { 0x2325, 0x2325, 2 },
  { 0x2460, 0x24ff, 2 },
  { 0x2500, 0x254b, 1 },
  { 0x2550, 0x2573, 1 },
  { 0x2580, 0x258f, 1 },
  { 0x2592, 0x2595, 1 },
  { 0x25a0, 0x25d7, 2 },
  { 0x25d8, 0x25d8, 1 },
  { 0x25d9, 0x25e5, 2 },
  { 0x25e6, 0x25e6, 1 },
  { 0x25e7, 0x2653, 2 },
  { 0x2654, 0x2667, 1 },
  { 0x2668, 0x2668, 2 },
  { 0x2669, 0x266f, 1 },
  { 0x2670, 0x2712, 2 },
  { 0x273d, 0x273d, 1 },
  { 0x2744, 0x2744, 2 },
  { 0x2747, 0x2747, 2 },
  { 0x2763, 0x2763, 2 },
  { 0x2776, 0x2793, 2 },
  { 0x27dd, 0x27de, 2 },
  { 0x27f5, 0x27ff, 2 },
  { 0x2b33, 0x2b33, 2 },
  { 0x2b56, 0x2b59, 1 },
  { 0x3248, 0x324f, 2 },
  { 0xe000, 0xedff, 2 },
  { 0xee00, 0xee0b, 1 },
  { 0xee0c, 0xf8ff, 2 },
  { 0xfffd, 0xfffd, 1 },
  { 0x1f000, 0x1f02b, 2 },
  { 0x1f030, 0x1f093, 2 },
  { 0x1f0a0, 0x1f0f5, 2 },
  { 0x1f100, 0x1faf8, 2 },
  { 0xf0000, 0x10fffd, 2 },
}

return M
