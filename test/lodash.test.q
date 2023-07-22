import {"../src/lodash.q"}

.kest.Test["chunk list";{
  .kest.Match[(0 1 2 3;4 5 6 7;enlist 8);.lo.Chunk[til 9;4]]
 }];
