.lo.Chunk:{[list;size]
  (0N,size)#list
 };

.lo.FlattenDeep:{[list](,//)list};

.lo.FlattenDepth:{[list;depth]
  depth (,/)/ list
 };

.lo.LastIndexOf:{[list;item]
  last where list=item
 };

/ support negative index
.lo.At:{[list;index]
  index:[index<0;index+count list;index];
  list@index
 };

.lo.Slice:{[list;start;end]
  n:count list;
  start:$[start<0;n+start;start];
  end:$[end<0;n+end;end];
  if[start>end;'"shouldStartLessThanEnd"];
  start _ end#list
 };

.lo.xor:{[setA;setB]
  :distinct (setA except setB), setB except setA
 };

.lo.DictFromPairs:{[pairs]
  (!) . flip pairs
 };

.lo.Map:{[list;function]
  @[function;list;{:y each z}[;function;list]]
 };

.lo.Filter:{[list;function]
  / if array operation fails, use each operation
  :list where .lo.Map[list;function]
 };

.lo.FlatMap:{[list;function]
  :(,/) .lo.Map[list;function]
 };

.lo.Shuffle:{[list]
  (neg count list)?list
 };
