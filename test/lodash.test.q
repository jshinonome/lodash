import {"../src/lodash.q"}

.kest.Test["chunk list";{
  .kest.Match[(0 1 2 3;4 5 6 7;enlist 8);.lo.Chunk[til 9;4]]
 }];

.kest.Test["flatten deep";{
  l:((1;2;(3;4;(5;6));7;8);9);
  .kest.Match[1+til 9;.lo.FlattenDeep l]
 }];

.kest.Test["flatten depth";{
  l:((1;2;(3;4;(5;`6));7;8);9);
  .kest.Match[(1;2;3;4;(5;`6);7;8;9);.lo.FlattenDepth[l;2]]
 }];

.kest.Test["apply function to columns";{
  t:([]sym:`7203`8252;venue:`T`T);
  f:{[sym;venue]` sv sym,venue};
  .kest.Match[`7203.T`8252.T;.lo.ApplyToColumns[t;f]]
 }];

.kest.Test["apply projection to columns";{
  t:([]startDate:2023.08.06 2023.08.07);
  f:{[startDate;endDate] startDate + til 1+endDate-startDate};
  .kest.Match[(2023.08.06 2023.08.07 2023.08.08;2023.08.07 2023.08.08);.lo.ApplyToColumns[t;f[;2023.08.08]]]
 }];
