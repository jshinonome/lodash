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

.lo.Xor:{[setA;setB]
  :distinct (setA except setB), setB except setA
 };

.lo.DictFromPairs:{[pairs]
  (!) . flip pairs
 };

.lo.Filter:{[list;function]
  / if array operation fails, use each operation
  :list where function list
 };

.lo.Shuffle:{[list]
  (neg count list)?list
 };

.lo.ApplyToColumns:{[table;function]
  params:.lo.getParams function;
  if[not all params in cols table;'"function parameters are not matched with column names"];
  ?[table;();();(enlist(';function)),params]
 };

.lo.getParamsFromProjection:{[projection]
  l:value projection;
  function:first l;
  params:(value function)1;
  args:1_l;
  i:where not 104=type each (~)[(::)]each args;
  :params @ (til count params) except i;
 };

.lo.getParams:{[function]
  kType:type function;
  $[100h=kType;
      (value function)1;
    104h=kType;
      .lo.getParamsFromProjection function;
      '"not support type ", string kType
  ]
 };

/ only type(104h), value(0) can be applied project null
.lo.projectionNull:-9!0x010000000a00000065ff;

.lo.isProjectionNull:{104h=type ~[(::)]x};

.lo.MagicFlattenApply:{[list;function]
  / need to define a global function to reduce time and memory usage
  .lo.tmpFn:function;
  {[x;y;z]z;x,:.lo.tmpFn y;x}/[();list;(::)]
 };
