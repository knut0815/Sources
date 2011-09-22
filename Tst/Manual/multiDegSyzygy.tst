LIB "tst.lib"; tst_init();
LIB "multigrading.lib";
ring r = 0,(x,y,z,w),dp;
intmat MM[2][4]=
1,1,1,1,
0,1,3,4;
setBaseMultigrading(MM);
module M = ideal(  xw-yz, x2z-y3, xz2-y2w, yw2-z3);
intmat v[2][nrows(M)]=
1,
0;
M = setModuleGrading(M, v);
isHomogeneous(M);
"Multidegrees: "; print(multiDeg(M));
// Let's compute syzygies!
def S = multiDegSyzygy(M); S;
"Module Units Multigrading: "; print( getModuleGrading(S) );
"Multidegrees: "; print(multiDeg(S));
isHomogeneous(S);
tst_status(1);$
