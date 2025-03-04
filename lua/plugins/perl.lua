local spec = {
  -- source
  "vim-perl/vim-perl",
  commit = "25ecb0061a3558d242a471b162aad20e4308815d",
  build = "make clean carp heredoc-sql highlight-all-pragmas method-signatures moose test-more try-tiny object-pad",
  -- sbom
  license = {
    file = "COPYING",
    spdx = "Vim",
  },
  -- loading
  ft = { "perl" },
}

return spec
