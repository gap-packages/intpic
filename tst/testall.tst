#############################################################################
##
#A  testall.tst        IntPic package                   Manuel Delgado
##                                                    
##  (based on the corresponding file of the 'example' package, 
##   by Alexander Konovalov) 
##
##  To create a test file, place GAP prompts, input and output exactly as
##  they must appear in the GAP session. Do not remove lines containing 
##  START_TEST and STOP_TEST statements.
##
##  The first line starts the test. START_TEST reinitializes the caches and 
##  the global random number generator, in order to be independent of the 
##  reading order of several test files. Furthermore, the assertion level 
##  is set to 2 by START_TEST and set back to the previous value in the 
##  subsequent STOP_TEST call.
##
##  The argument of STOP_TEST may be an arbitrary identifier string.
## 
gap> START_TEST("IntPic package: testall.tst");

# Note that you may use comments in the test file
# and also separate parts of the test by empty lines

# First load the package without banner (the banner must be suppressed to 
# avoid reporting discrepancies in the case when the package is already 
# loaded)
gap> LoadPackage("intpic",false);
true

# Check that the data are consistent  
gap> rg := [801..999];;
gap> flen := 15;;
gap> primes := Filtered(rg,IsPrime);
[ 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 
  937, 941, 947, 953, 967, 971, 977, 983, 991, 997 ]
gap> twins := Filtered(primes, p -> IsPrime(p+2)); #A list consisting of the first
[ 809, 821, 827, 857, 881 ]
gap> #elements of pairs of twin primes  
gap> rgnp := Difference(rg,primes);
[ 801, 802, 803, 804, 805, 806, 807, 808, 810, 812, 813, 814, 815, 816, 817, 818, 819, 820, 822, 
  824, 825, 826, 828, 830, 831, 832, 833, 834, 835, 836, 837, 838, 840, 841, 842, 843, 844, 845, 
  846, 847, 848, 849, 850, 851, 852, 854, 855, 856, 858, 860, 861, 862, 864, 865, 866, 867, 868, 
  869, 870, 871, 872, 873, 874, 875, 876, 878, 879, 880, 882, 884, 885, 886, 888, 889, 890, 891, 
  892, 893, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903, 904, 905, 906, 908, 909, 910, 912, 
  913, 914, 915, 916, 917, 918, 920, 921, 922, 923, 924, 925, 926, 927, 928, 930, 931, 932, 933, 
  934, 935, 936, 938, 939, 940, 942, 943, 944, 945, 946, 948, 949, 950, 951, 952, 954, 955, 956, 
  957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 968, 969, 970, 972, 973, 974, 975, 976, 978, 
  979, 980, 981, 982, 984, 985, 986, 987, 988, 989, 990, 992, 993, 994, 995, 996, 998, 999 ]
gap> arr := [primes,
> [1],
> Union(twins,twins+2),
> # now the non primes...
> Filtered(rgnp,u->(u mod 2)=0),
> Filtered(rgnp,u->(u mod 3)=0),
> Filtered(rgnp,u->(u mod 5)=0),
> [],[], # to avoid some colors
> Filtered(rgnp,u->(u mod 7)=0),
> Filtered(rgnp,u->(u mod 11)=0),
> Filtered(rgnp,u->(u mod 13)=0),
> Filtered(rgnp,u->(u mod 17)=0),
> Filtered(rgnp,u->(u mod 19)=0),
> Filtered(rgnp,u->(u mod 23)=0),
> Filtered(rgnp,u->(u mod 29)=0),
> Filtered(rgnp,u->(u mod 31)=0),
> Filtered(rgnp,u->(u mod 37)=0),
> Filtered(rgnp,u->(u mod 41)=0),
> Filtered(rgnp,u->(u mod 43)=0),
> Filtered(rgnp,u->(u mod 47)=0),
> Filtered(rgnp,u->(u mod 53)=0)];
[ [ 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 
      937, 941, 947, 953, 967, 971, 977, 983, 991, 997 ], [ 1 ], 
  [ 809, 811, 821, 823, 827, 829, 857, 859, 881, 883 ], 
  [ 802, 804, 806, 808, 810, 812, 814, 816, 818, 820, 822, 824, 826, 828, 830, 832, 834, 836, 838, 
      840, 842, 844, 846, 848, 850, 852, 854, 856, 858, 860, 862, 864, 866, 868, 870, 872, 874, 
      876, 878, 880, 882, 884, 886, 888, 890, 892, 894, 896, 898, 900, 902, 904, 906, 908, 910, 
      912, 914, 916, 918, 920, 922, 924, 926, 928, 930, 932, 934, 936, 938, 940, 942, 944, 946, 
      948, 950, 952, 954, 956, 958, 960, 962, 964, 966, 968, 970, 972, 974, 976, 978, 980, 982, 
      984, 986, 988, 990, 992, 994, 996, 998 ], 
  [ 801, 804, 807, 810, 813, 816, 819, 822, 825, 828, 831, 834, 837, 840, 843, 846, 849, 852, 855, 
      858, 861, 864, 867, 870, 873, 876, 879, 882, 885, 888, 891, 894, 897, 900, 903, 906, 909, 
      912, 915, 918, 921, 924, 927, 930, 933, 936, 939, 942, 945, 948, 951, 954, 957, 960, 963, 
      966, 969, 972, 975, 978, 981, 984, 987, 990, 993, 996, 999 ], 
  [ 805, 810, 815, 820, 825, 830, 835, 840, 845, 850, 855, 860, 865, 870, 875, 880, 885, 890, 895, 
      900, 905, 910, 915, 920, 925, 930, 935, 940, 945, 950, 955, 960, 965, 970, 975, 980, 985, 
      990, 995 ], [  ], [  ], [ 805, 812, 819, 826, 833, 840, 847, 854, 861, 868, 875, 882, 889, 
      896, 903, 910, 917, 924, 931, 938, 945, 952, 959, 966, 973, 980, 987, 994 ], 
  [ 803, 814, 825, 836, 847, 858, 869, 880, 891, 902, 913, 924, 935, 946, 957, 968, 979, 990 ], 
  [ 806, 819, 832, 845, 858, 871, 884, 897, 910, 923, 936, 949, 962, 975, 988 ], 
  [ 816, 833, 850, 867, 884, 901, 918, 935, 952, 969, 986 ], 
  [ 817, 836, 855, 874, 893, 912, 931, 950, 969, 988 ], 
  [ 805, 828, 851, 874, 897, 920, 943, 966, 989 ], [ 812, 841, 870, 899, 928, 957, 986 ], 
  [ 806, 837, 868, 899, 930, 961, 992 ], [ 814, 851, 888, 925, 962, 999 ], 
  [ 820, 861, 902, 943, 984 ], [ 817, 860, 903, 946, 989 ], [ 846, 893, 940, 987 ], 
  [ 848, 901, 954 ] ]
gap> 
gap> tkz := IP_TikzArrayOfIntegers(rg,flen,rec(cell_width := "27",highlights:=arr));;

#gap> IP_Splash(tkz);;

gap> rg := [81..89];;
gap> len := 5;;
gap> arr := [Filtered(rg,IsPrime),Filtered(rg,u->(u mod 2)=0),
>         Filtered(rg,u->(u mod 3)=0)];;
gap> tkz := IP_TikzArrayOfIntegers(rg,len,rec(highlights:=arr));;

#gap> IP_Splash(tkz);;


#############################################################################
# Some more elaborated tests
gap> a := 8;; b := 19;;  
gap> ns := NumericalSemigroup(a,b);;
gap> c := ConductorOfNumericalSemigroup(ns);;
gap> origin := 2*c-1;
251
gap> ground := [origin..origin+b-1];;
gap> 
gap> height:=2;;
gap> depth:=8;;
gap>   xaxis := [origin];;
gap>   for n in [1..b-1] do
>     Add(xaxis, origin+n*a);
>   od;
gap>   yaxis := [];;
gap>   for n in [-depth..height] do
>     Add(yaxis, origin+n*b);
>   od;
gap> 
gap> table := IP_TableWithModularOrder(origin,a,b,depth,height,false,false);
[ [ 99, 107, 115, 123, 131, 139, 147, 155, 163, 171, 179, 187, 195, 203, 211, 
      219, 227, 235, 243 ], 
  [ 118, 126, 134, 142, 150, 158, 166, 174, 182, 190, 198, 206, 214, 222, 
      230, 238, 246, 254, 262 ], 
  [ 137, 145, 153, 161, 169, 177, 185, 193, 201, 209, 217, 225, 233, 241, 
      249, 257, 265, 273, 281 ], 
  [ 156, 164, 172, 180, 188, 196, 204, 212, 220, 228, 236, 244, 252, 260, 
      268, 276, 284, 292, 300 ], 
  [ 175, 183, 191, 199, 207, 215, 223, 231, 239, 247, 255, 263, 271, 279, 
      287, 295, 303, 311, 319 ], 
  [ 194, 202, 210, 218, 226, 234, 242, 250, 258, 266, 274, 282, 290, 298, 
      306, 314, 322, 330, 338 ], 
  [ 213, 221, 229, 237, 245, 253, 261, 269, 277, 285, 293, 301, 309, 317, 
      325, 333, 341, 349, 357 ], 
  [ 232, 240, 248, 256, 264, 272, 280, 288, 296, 304, 312, 320, 328, 336, 
      344, 352, 360, 368, 376 ], 
  [ 251, 259, 267, 275, 283, 291, 299, 307, 315, 323, 331, 339, 347, 355, 
      363, 371, 379, 387, 395 ], 
  [ 270, 278, 286, 294, 302, 310, 318, 326, 334, 342, 350, 358, 366, 374, 
      382, 390, 398, 406, 414 ], 
  [ 289, 297, 305, 313, 321, 329, 337, 345, 353, 361, 369, 377, 385, 393, 
      401, 409, 417, 425, 433 ] ]
gap> arr := [xaxis,yaxis,ground];
[ [ 251, 259, 267, 275, 283, 291, 299, 307, 315, 323, 331, 339, 347, 355, 
      363, 371, 379, 387, 395 ], 
  [ 99, 118, 137, 156, 175, 194, 213, 232, 251, 270, 289 ], [ 251 .. 269 ] ]
gap> tkz:=IP_TikzArrayOfIntegers(table,rec(highlights:=arr));;

#gap> IP_Splash(tkz);;

gap> tkz:=IP_TikzArrayOfIntegers(table,rec(highlights:=arr,shape_only:="",
>              cell_width := "6",colsep:="1",rowsep:="1",inner_sep:="2",
>              line_color:="black!20"));;

#gap> IP_Splash(tkz);;

gap> Print(tkz);
%tikz
\begin{tikzpicture}[every node/.style={draw,scale=1pt,
minimum width=6pt,inner sep=2pt,
line width=0pt,draw=black!20}]
\matrix[row sep=1pt,column sep=1pt]
{\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[left color=red,right color=green,middle color=blue]{ };&
\node[left color=red,right color=blue]{ };&
\node[left color=red,right color=blue]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };&
\node[fill=red]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };&
\node[]{ };&
\node[]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[fill=blue]{ };&
\node[fill=blue]{ };\\
\node[fill=green]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };&
\node[]{ };\\
};
\end{tikzpicture}

#############################################################################
#############################################################################
# Examples from the manual
# (These examples use at least a function from each file)

## functions.xml ##

gap> rg := [81..89];
[ 81 .. 89 ]
gap> len := 10;
10
gap> arr := [Filtered(rg,IsPrime),Filtered(rg,u->(u mod 2)=0),
>         Filtered(rg,u->(u mod 3)=0)];
[ [ 83, 89 ], [ 82, 84, 86, 88 ], [ 81, 84, 87 ] ]
gap> tkz := IP_TikzArrayOfIntegers(rg,len,rec(highlights:=arr));
"%tikz\n\\begin{tikzpicture}[every node/.style={draw,scale=1pt,\nminimum width\
=20pt,inner sep=3pt,\nline width=0pt,draw=black}]\n\\matrix[row sep=2pt,column\
 sep=2pt]\n{\\node[fill=blue]{81};&\n\\node[fill=green]{82};&\n\\node[fill=red\
]{83};&\n\\node[left color=green,right color=blue]{84};&\n\\node[]{85};&\n\\no\
de[fill=green]{86};&\n\\node[fill=blue]{87};&\n\\node[fill=green]{88};&\n\\nod\
e[fill=red]{89};\\\\\n};\n\\end{tikzpicture}\n"
gap> Print(tkz);
%tikz
\begin{tikzpicture}[every node/.style={draw,scale=1pt,
minimum width=20pt,inner sep=3pt,
line width=0pt,draw=black}]
\matrix[row sep=2pt,column sep=2pt]
{\node[fill=blue]{81};&
\node[fill=green]{82};&
\node[fill=red]{83};&
\node[left color=green,right color=blue]{84};&
\node[]{85};&
\node[fill=green]{86};&
\node[fill=blue]{87};&
\node[fill=green]{88};&
\node[fill=red]{89};\\
};
\end{tikzpicture}

gap> d := DivisorsInt(30);
[ 1, 2, 3, 5, 6, 10, 15, 30 ]
gap> IP_SimpleTikzArrayOfIntegers(d);;

gap> d30 := DivisorsInt(30);
[ 1, 2, 3, 5, 6, 10, 15, 30 ]
gap> d40 := DivisorsInt(40);
[ 1, 2, 4, 5, 8, 10, 20, 40 ]
gap> tkz := IP_SimpleTikzArrayOfIntegers([d30,d40]);;

gap> a := 8;; b := 19;;  
gap> ns := NumericalSemigroup(a,b);;
gap> c := ConductorOfNumericalSemigroup(ns);;
gap> origin := 2*c-1;
251
gap> ground := [origin..origin+b-1];;
gap> 
gap> height:=2;;
gap> depth:=8;;
gap>   xaxis := [origin];;
gap>   for n in [1..b-1] do
>     Add(xaxis, origin+n*a);
>   od;
gap>   yaxis := [];;
gap>   for n in [-depth..height] do
>     Add(yaxis, origin+n*b);
>   od;
gap> 
gap> table := IP_TableWithModularOrder(origin,a,b,depth,height,false,false);;
gap> arr := [xaxis,yaxis,ground];
[ [ 251, 259, 267, 275, 283, 291, 299, 307, 315, 323, 331, 339, 347, 355, 
      363, 371, 379, 387, 395 ], 
  [ 99, 118, 137, 156, 175, 194, 213, 232, 251, 270, 289 ], [ 251 .. 269 ] ]
gap> tkz:=IP_TikzArrayOfIntegers(table,rec(highlights:=arr));;
gap> tkz:=IP_TikzArrayOfIntegers(table,rec(highlights:=arr,shape_only:="",
>              cell_width := "6",colsep:="1",rowsep:="1",inner_sep:="2",
>              line_color:="black!20"));;

gap> table := IP_TableWithModularOrder(origin,a,b,depth,50,true,true);;
gap> tkz:=IP_TikzArrayOfIntegers(table,rec(highlights:=arr));;

## colors.xml ##

gap> IP_ColorsRedTones; #red
[ "red", "red!50", "red!20", "red!80!green!50", "red!80!blue!60" ]

gap> IP_ColorsGreenTones; #green
[ "green", "green!50", "green!20", "green!80!red!50", "green!80!blue!60" ]

gap> IP_ColorsBlueTones; #blue
[ "blue", "blue!50", "blue!20", "blue!80!red!50", "blue!80!green!60" ]

gap> IP_ColorsCompRedTones; # cyan (complement of red)
[ "-red", "-red!50", "-red!20", "-red!80!green!50", "-red!80!blue!60" ]

gap> IP_ColorsCompGreenTones; # magenta (complement of green)
[ "-green", "-green!50", "-green!20", "-green!80!red!50", "-green!80!blue!60" ]

gap> IP_ColorsCompBlueTones; # yellow (complement of blue)
[ "-blue", "-blue!50", "-blue!20", "-blue!80!red!50", "-blue!80!green!60" ]

gap> IP_ColorsDGrayTones; # dark gray
[ "black!80", "black!70", "black!60", "black!50", "black!40" ]

gap> IP_ColorsLGrayTones; # light gray
[ "black!30", "black!25", "black!20", "black!15", "black!10" ]

gap> ListsOfIP_Colors;
[ [ "red", "red!50", "red!20", "red!80!green!50", "red!80!blue!60" ], 
  [ "green", "green!50", "green!20", "green!80!red!50", "green!80!blue!60" ], 
  [ "blue", "blue!50", "blue!20", "blue!80!red!50", "blue!80!green!60" ], 
  [ "-red", "-red!50", "-red!20", "-red!80!green!50", "-red!80!blue!60" ], 
  [ "-green", "-green!50", "-green!20", "-green!80!red!50", 
      "-green!80!blue!60" ], 
  [ "-blue", "-blue!50", "-blue!20", "-blue!80!red!50", "-blue!80!green!60" ],
  [ "black!80", "black!70", "black!60", "black!50", "black!40" ], 
  [ "black!30", "black!25", "black!20", "black!15", "black!10" ] ]

gap> IP_Colors;
[ "red", "red!50", "red!20", "red!80!green!50", "red!80!blue!60", "green", 
  "green!50", "green!20", "green!80!red!50", "green!80!blue!60", "blue", 
  "blue!50", "blue!20", "blue!80!red!50", "blue!80!green!60", "-red", 
  "-red!50", "-red!20", "-red!80!green!50", "-red!80!blue!60", "-green", 
  "-green!50", "-green!20", "-green!80!red!50", "-green!80!blue!60", "-blue", 
  "-blue!50", "-blue!20", "-blue!80!red!50", "-blue!80!green!60", "black!80", 
  "black!70", "black!60", "black!50", "black!40", "black!30", "black!25", 
  "black!20", "black!15", "black!10" ]

gap> ShuffledIP_colors;
[ "red", "green", "blue", "-red", "-green", "-blue", "black!80", "black!30", 
  "red!50", "green!50", "blue!50", "-red!50", "-green!50", "-blue!50", 
  "black!70", "black!25", "red!20", "green!20", "blue!20", "-red!20", 
  "-green!20", "-blue!20", "black!60", "black!20", "red!80!green!50", 
  "green!80!red!50", "blue!80!red!50", "-red!80!green!50", "-green!80!red!50",
  "-blue!80!red!50", "black!50", "black!15", "red!80!blue!60", 
  "green!80!blue!60", "blue!80!green!60", "-red!80!blue!60", 
  "-green!80!blue!60", "-blue!80!green!60", "black!40", "black!10" ]

gap> m3 := Filtered([1..40],i->i mod 3=0);
[ 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39 ]
gap> m5 := Filtered([1..40],i->i mod 5=0);
[ 5, 10, 15, 20, 25, 30, 35, 40 ]
gap> m7 := Filtered([1..40],i->i mod 7=0);
[ 7, 14, 21, 28, 35 ]
gap> 
gap> arr := [[],[],m3,[],m5,[],m7];;
gap> tkz:=IP_TikzArrayOfIntegers([1..40],10,rec(highlights:=arr));;

## visualisation.xml ##

gap> Print(IP_Preamble);
\documentclass{minimal}
\usepackage{amsmath}
\usepackage[active,tightpage]{preview}
\setlength\PreviewBorder{1pt}
\usepackage{pgf}
\usepackage{tikz}
\usepgfmodule{plot}
\usepgflibrary{plothandlers}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{shadings}
\begin{document}
\begin{preview}

gap> tikzfile := "tikz_pic_for_complete_document.tex";;
gap> file := "pic_for_complete_document.tex";;
gap> 
gap> arr := [[1,2,3,4,5,6],[1,2,3,4,5],[1,2,3,4],[1,2,3],[1,2],[1]];;
gap> tkz := IP_TikzArrayOfIntegers([1..10],5,rec(highlights:=arr));;
gap> 
gap> FileString(tikzfile,tkz);
642
gap> FileString(file,Concatenation(IP_Preamble,tkz,IP_Closing));
961

gap> rg := Filtered([801..889],u->(u mod 2)<>0);;
gap> flen := 15;;
gap> twins := Filtered(Primes, p -> p + 2 in Primes);;
gap> arr := [Primes,Union(twins,twins+2),Filtered(rg,u->(u mod 3)=0)];;
gap> tkz := IP_TikzArrayOfIntegers(rg,flen,rec(highlights:=arr));;

gap> cls := IP_ColorsCompRedTones;;
gap> rg := Filtered([801..889],u->(u mod 2)<>0);;
gap> flen := 15;;
gap> twins := Filtered(Primes, p -> p + 2 in Primes);;
gap> arr := [Primes,Union(twins,twins+2),Filtered(rg,u->(u mod 3)=0)];;
gap> tkz := IP_TikzArrayOfIntegers(rg,flen,rec(colors := cls,highlights:=arr));;

gap> cls := IP_ColorsDGrayTones;;
gap> rg := Filtered([801..889],u->(u mod 2)<>0);;
gap> flen := 15;;
gap> twins := Filtered(Primes, p -> p + 2 in Primes);;
gap> arr := [Primes,Union(twins,twins+2),Filtered(rg,u->(u mod 3)=0)];;
gap> tkz := IP_TikzArrayOfIntegers(rg,flen,rec(colors := cls,highlights:=arr));;

gap> cls := ["blue","-blue","black"];;
gap> rg := Filtered([801..889],u->(u mod 2)<>0);;
gap> flen := 15;;
gap> twins := Filtered(Primes, p -> p + 2 in Primes);;
gap> arr := [Primes,Union(twins,twins+2),Filtered(rg,u->(u mod 3)=0)];;
gap> tkz := IP_TikzArrayOfIntegers(rg,flen,rec( colors := cls,highlights:=arr));;

gap> ns := NumericalSemigroup(11,19,30,42,59);;
gap> cls := ShuffleIP_Colors([IP_ColorsGreenTones,IP_ColorsCompBlueTones]);;
gap> flen := 20;;
gap> #some notable elements
gap> arr := [SmallElementsOfNumericalSemigroup(ns),
>         GapsOfNumericalSemigroup(ns),
>         MinimalGeneratingSystemOfNumericalSemigroup(ns),
>         FundamentalGapsOfNumericalSemigroup(ns),
>         [ConductorOfNumericalSemigroup(ns)],
>         PseudoFrobeniusOfNumericalSemigroup(ns)];;
gap> 
gap> tkz := IP_TikzArrayOfIntegers(flen,rec(colors := cls,highlights:=arr));;

gap> row_length := 200;; # the length of each row
gap> columns := 50;; # the number of columns
gap> n := row_length*columns;
10000
gap> 
gap> ##compute the primes less than n
gap> # Primes is a GAP variable representing the list of primes less than 1000
gap> mp := Maximum(Primes);
997
gap> newprimes := [];;
gap> while mp < n do
>   mp := NextPrimeInt(mp);
>   Add(newprimes, mp);
> od;
gap> small_primes := Union(Primes, newprimes);;
gap> ##compute the first element of each pair of twin primes less than n
gap> twins := Filtered(small_primes, p -> IsPrime(p+2));;
gap> 
gap> rg := [1..n];;
gap> 
gap> arr := [Intersection(small_primes,rg),[],[], 
>         Intersection(Union(twins,twins+2),rg),[],[],[],[],[],[],[],
>         [],[],[],[],[],[],Difference(rg,small_primes)];;
gap> 
gap> tkz:=IP_TikzArrayOfIntegers([1..n],row_length,rec(highlights:=arr,
>              cell_width := "6",colsep:="0",rowsep:="0",inner_sep:="2",
>              shape_only:="",line_width:="0",line_color:="black!20" ));;

## options.xml ##

gap> RecNames(IP_TikzDefaultOptionsForArraysOfIntegers);
[ "other", "colors", "highlights", "shape_only", "colsep", "rowsep", 
  "cell_width", "allow_adjust_cell_width", "scale", "inner_sep", 
  "line_width", "line_color", "negatives" ]

gap> IP_TikzDefaultOptionsForArraysOfIntegers;
rec( allow_adjust_cell_width := "10", cell_width := "30", 
  colors := [ "red", "green", "blue", "-red", "-green", "-blue", "black!80", 
      "black!30", "red!50", "green!50", "blue!50", "-red!50", "-green!50", 
      "-blue!50", "black!70", "black!25", "red!20", "green!20", "blue!20", 
      "-red!20", "-green!20", "-blue!20", "black!60", "black!20", 
      "red!80!green!50", "green!80!red!50", "blue!80!red!50", 
      "-red!80!green!50", "-green!80!red!50", "-blue!80!red!50", "black!50", 
      "black!15", "red!80!blue!60", "green!80!blue!60", "blue!80!green!60", 
      "-red!80!blue!60", "-green!80!blue!60", "-blue!80!green!60", 
      "black!40", "black!10" ], colsep := "2", highlights := [ [  ] ], 
  inner_sep := "3", line_color := "black", line_width := "0", 
  negatives := true, other := [  ], rowsep := "2", 
  scale := "1", shape_only := "false" )

gap> rg := [-5..23];;
gap> len := 10;;  
gap> hg := rec();;                                        
gap> hg.highlights:=[[2,3,5,7],[11,13,17,19],[23]];; 
gap> tkz := IP_TikzArrayOfIntegers(rg,len,hg);;
gap> Print(tkz);
%tikz
\begin{tikzpicture}[every node/.style={draw,scale=1pt,
minimum width=20pt,inner sep=3pt,
line width=0pt,draw=black}]
\matrix[row sep=2pt,column sep=2pt]
{\node[]{15};&
\node[]{16};&
\node[fill=green]{17};&
\node[]{18};&
\node[fill=green]{19};&
\node[]{20};&
\node[]{21};&
\node[]{22};&
\node[fill=blue]{23};\\
\node[fill=red]{5};&
\node[]{6};&
\node[fill=red]{7};&
\node[]{8};&
\node[]{9};&
\node[]{10};&
\node[fill=green]{11};&
\node[]{12};&
\node[fill=green]{13};&
\node[]{14};\\
\node[]{-5};&
\node[]{-4};&
\node[]{-3};&
\node[]{-2};&
\node[]{-1};&
\node[]{0};&
\node[]{1};&
\node[fill=red]{2};&
\node[fill=red]{3};&
\node[]{4};\\
};
\end{tikzpicture}
gap> #IP_Splash(tkz);
gap> hg.negatives:=false;;
gap> tkz := IP_TikzArrayOfIntegers(rg,len,hg);;
gap> Print(tkz);
%tikz
\begin{tikzpicture}[every node/.style={draw,scale=1pt,
minimum width=20pt,inner sep=3pt,
line width=0pt,draw=black}]
\matrix[row sep=2pt,column sep=2pt]
{\node[]{15};&
\node[]{16};&
\node[fill=green]{17};&
\node[]{18};&
\node[fill=green]{19};&
\node[]{20};&
\node[]{21};&
\node[]{22};&
\node[fill=blue]{23};\\
\node[fill=red]{5};&
\node[]{6};&
\node[fill=red]{7};&
\node[]{8};&
\node[]{9};&
\node[]{10};&
\node[fill=green]{11};&
\node[]{12};&
\node[fill=green]{13};&
\node[]{14};\\
&
&
&
&
&
\node[]{0};&
\node[]{1};&
\node[fill=red]{2};&
\node[fill=red]{3};&
\node[]{4};\\
};
\end{tikzpicture}

## routines_for_NS.xml ##

gap> ns := NumericalSemigroup(5,7);;                                               
gap> tkz := TikzCodeForNumericalSemigroup(ns,["ns_table"],rec(negatives:=false));
#I  In order to highlight some element, please use a list with one or more of the options given as strings: pseudo_frobenius, min_generators, frobenius_number, conductor, special_gaps, fundamental_gaps, small_elements

"%tikz\n\\begin{tikzpicture}[every node/.style={draw,scale=1pt,\nminimum width\
=20pt,inner sep=3pt,\nline width=0pt,draw=black}]\n\\matrix[row sep=2pt,column\
 sep=2pt]\n{\\node[]{24};&\n\\node[]{25};&\n\\node[]{26};&\n\\node[]{27};&\n\\\
node[]{28};\\\\\n\\node[]{19};&\n\\node[]{20};&\n\\node[]{21};&\n\\node[]{22};\
&\n\\node[]{23};\\\\\n\\node[]{14};&\n\\node[]{15};&\n\\node[]{16};&\n\\node[]\
{17};&\n\\node[]{18};\\\\\n\\node[]{9};&\n\\node[]{10};&\n\\node[]{11};&\n\\no\
de[]{12};&\n\\node[]{13};\\\\\n\\node[]{4};&\n\\node[]{5};&\n\\node[]{6};&\n\\\
node[]{7};&\n\\node[]{8};\\\\\n&\n\\node[]{0};&\n\\node[]{1};&\n\\node[]{2};&\
\n\\node[]{3};\\\\\n};\n\\end{tikzpicture}\n"

gap> tkz := TikzCodeForNumericalSemigroup(ns,["small_elements"],rec(ns_table := true,negatives:=false)); 
"%tikz\n\\begin{tikzpicture}[every node/.style={draw,scale=1pt,\nminimum width=20pt,inner sep=3pt,\nline width=0pt,draw=black}]\n\\matr\
ix[row sep=2pt,column sep=2pt]\n{\\node[fill=red]{24};&\n\\node[fill=red]{25};&\n\\node[fill=red]{26};&\n\\node[fill=red]{27};&\n\\node\
[fill=red]{28};\\\\\n\\node[fill=red]{19};&\n\\node[fill=red]{20};&\n\\node[fill=red]{21};&\n\\node[fill=red]{22};&\n\\node[]{23};\\\\\
\n\\node[fill=red]{14};&\n\\node[fill=red]{15};&\n\\node[]{16};&\n\\node[fill=red]{17};&\n\\node[]{18};\\\\\n\\node[]{9};&\n\\node[fill\
=red]{10};&\n\\node[]{11};&\n\\node[fill=red]{12};&\n\\node[]{13};\\\\\n\\node[]{4};&\n\\node[fill=red]{5};&\n\\node[]{6};&\n\\node[fil\
l=red]{7};&\n\\node[]{8};\\\\\n&\n\\node[fill=red]{0};&\n\\node[]{1};&\n\\node[]{2};&\n\\node[]{3};\\\\\n};\n\\end{tikzpicture}\n"

gap> ns1 := NumericalSemigroup(3,5);;
gap> TikzCodeForNumericalSemigroup(ns1,[[3,4],"pseudo_frobenius"],20);
"%tikz\n\\begin{tikzpicture}[every node/.style={draw,scale=1pt,\nminimum width\
=20pt,inner sep=3pt,\nline width=0pt,draw=black}]\n\\matrix[row sep=2pt,column\
 sep=2pt]\n{\\node[]{0};&\n\\node[]{1};&\n\\node[]{2};&\n\\node[fill=red]{3};&\
\n\\node[fill=red]{4};&\n\\node[]{5};&\n\\node[]{6};&\n\\node[fill=green]{7};&\
\n\\node[]{8};&\n\\node[]{9};&\n\\node[]{10};&\n\\node[]{11};&\n\\node[]{12};&\
\n\\node[]{13};&\n\\node[]{14};&\n\\node[]{15};&\n\\node[]{16};&\n\\node[]{17}\
;&\n\\node[]{18};&\n\\node[]{19};&\n\\node[]{20};\\\\\n};\n\\end{tikzpicture}\
\n"

gap> ns := NumericalSemigroup(7,11,38,41);;
gap> highlights := ["conductor", "min_generators", "small_elements"];;
gap> options := rec(ns_table:=true,colors:=["blue", "red!70", "-red", "black!40"]);;
gap> tkz := TikzCodeForNumericalSemigroup(ns,highlights,options);
"%tikz\n\\begin{tikzpicture}[every node/.style={draw,scale=1pt,\nminimum width\
=20pt,inner sep=3pt,\nline width=0pt,draw=black}]\n\\matrix[row sep=2pt,column\
 sep=2pt]\n{\\node[left color=blue,right color=red!70,middle color=-red]{38};&\
\n\\node[fill=-red]{39};&\n\\node[fill=-red]{40};&\n\\node[left color=red!70,r\
ight color=-red]{41};&\n\\node[fill=-red]{42};&\n\\node[fill=-red]{43};&\n\\no\
de[fill=-red]{44};\\\\\n\\node[]{31};&\n\\node[fill=-red]{32};&\n\\node[fill=-\
red]{33};&\n\\node[]{34};&\n\\node[fill=-red]{35};&\n\\node[fill=-red]{36};&\n\
\\node[]{37};\\\\\n\\node[]{24};&\n\\node[fill=-red]{25};&\n\\node[]{26};&\n\\\
node[]{27};&\n\\node[fill=-red]{28};&\n\\node[fill=-red]{29};&\n\\node[]{30};\
\\\\\n\\node[]{17};&\n\\node[fill=-red]{18};&\n\\node[]{19};&\n\\node[]{20};&\
\n\\node[fill=-red]{21};&\n\\node[fill=-red]{22};&\n\\node[]{23};\\\\\n\\node[\
]{10};&\n\\node[left color=red!70,right color=-red]{11};&\n\\node[]{12};&\n\\n\
ode[]{13};&\n\\node[fill=-red]{14};&\n\\node[]{15};&\n\\node[]{16};\\\\\n\\nod\
e[]{3};&\n\\node[]{4};&\n\\node[]{5};&\n\\node[]{6};&\n\\node[left color=red!7\
0,right color=-red]{7};&\n\\node[]{8};&\n\\node[]{9};\\\\\n\\node[]{-4};&\n\\n\
ode[]{-3};&\n\\node[]{-2};&\n\\node[]{-1};&\n\\node[fill=-red]{0};&\n\\node[]{\
1};&\n\\node[]{2};\\\\\n};\n\\end{tikzpicture}\n"

gap> tkz := TikzCodeForNumericalSemigroup(ns,highlights,rec(ns_table:=true));
"%tikz\n\\begin{tikzpicture}[every node/.style={draw,scale=1pt,\nminimum width\
=20pt,inner sep=3pt,\nline width=0pt,draw=black}]\n\\matrix[row sep=2pt,column\
 sep=2pt]\n{\\node[left color=red,right color=green,middle color=blue]{38};&\n\
\\node[fill=blue]{39};&\n\\node[fill=blue]{40};&\n\\node[left color=green,righ\
t color=blue]{41};&\n\\node[fill=blue]{42};&\n\\node[fill=blue]{43};&\n\\node[\
fill=blue]{44};\\\\\n\\node[]{31};&\n\\node[fill=blue]{32};&\n\\node[fill=blue\
]{33};&\n\\node[]{34};&\n\\node[fill=blue]{35};&\n\\node[fill=blue]{36};&\n\\n\
ode[]{37};\\\\\n\\node[]{24};&\n\\node[fill=blue]{25};&\n\\node[]{26};&\n\\nod\
e[]{27};&\n\\node[fill=blue]{28};&\n\\node[fill=blue]{29};&\n\\node[]{30};\\\\\
\n\\node[]{17};&\n\\node[fill=blue]{18};&\n\\node[]{19};&\n\\node[]{20};&\n\\n\
ode[fill=blue]{21};&\n\\node[fill=blue]{22};&\n\\node[]{23};\\\\\n\\node[]{10}\
;&\n\\node[left color=green,right color=blue]{11};&\n\\node[]{12};&\n\\node[]{\
13};&\n\\node[fill=blue]{14};&\n\\node[]{15};&\n\\node[]{16};\\\\\n\\node[]{3}\
;&\n\\node[]{4};&\n\\node[]{5};&\n\\node[]{6};&\n\\node[left color=green,right\
 color=blue]{7};&\n\\node[]{8};&\n\\node[]{9};\\\\\n\\node[]{-4};&\n\\node[]{-\
3};&\n\\node[]{-2};&\n\\node[]{-1};&\n\\node[fill=blue]{0};&\n\\node[]{1};&\n\
\\node[]{2};\\\\\n};\n\\end{tikzpicture}\n"

gap> ls := SetOfNumericalSemigroups(rec(set:=rec(genus:=6),filter:=rec(type:= 2),order:="multiplicity"));;
gap> List(ls,MinimalGenerators);
[ [ 3, 8, 13 ], [ 3, 10, 11 ], [ 4, 7, 9 ], [ 5, 6, 7 ], [ 5, 6, 8 ], 
  [ 6, 7, 8, 9, 11 ] ]
gap> ls := SetOfNumericalSemigroups(rec(set:=rec(genus:=6),filter:=rec(type:= 2), order:="frobenius"));;
gap> List(ls,MinimalGenerators);
[ [ 3, 10, 11 ], [ 5, 6, 7 ], [ 5, 6, 8 ], [ 3, 8, 13 ], [ 4, 7, 9 ], 
  [ 6, 7, 8, 9, 11 ] ]

#gap> ns1 := NumericalSemigroup(3,5);;
#gap> ns2 := NumericalSemigroup(5,7,11);;
#gap> DrawSetOfNumericalSemigroups(ns1,rec(splash:=                          
#> rec(viewer := "evince"),highlights := 
#> ["pseudo_frobenius","small_elements","min_generators"]));
#gap> DrawSetOfNumericalSemigroups(ns1,ns2,rec(splash:= 
#> rec(viewer := "evince"),highlights := 
#> ["pseudo_frobenius","small_elements","min_generators"]));
#gap> DrawSetOfNumericalSemigroups([ns1,ns2],rec(splash:=      
#> rec(viewer := "evince"),highlights :=                    
#> ["small_elements","min_generators"]));                   

gap> frob := 15;;
gap> tipo := 2;;
gap> set := SetOfNumericalSemigroups(rec(set := rec(frobenius := frob),
> filter := rec(type:= tipo),order := "embedding_dimension"));
[ <Numerical semigroup with 3 generators>, 
  <Numerical semigroup with 3 generators>, 
  <Numerical semigroup with 4 generators>, 
  <Numerical semigroup with 5 generators>, 
  <Numerical semigroup with 5 generators>, 
  <Numerical semigroup with 5 generators>, 
  <Numerical semigroup with 6 generators>, 
  <Numerical semigroup with 6 generators>, 
  <Numerical semigroup with 6 generators> ]
  
gap> ns := NumericalSemigroup(4,9,19);;
gap> SmallElements(ns);
[ 0, 4, 8, 9, 12, 13, 16 ]
gap> MinimalGeneratingSystem(ns);
[ 4, 9, 19 ]
gap> ForcedIntegersForPseudoFrobenius(PseudoFrobeniusOfNumericalSemigroup(ns));
[ [ 1, 2, 3, 5, 6, 7, 14, 15 ], [ 0, 8, 9, 12, 13, 16 ] ]


gap> rg := [800..900];;
gap> flen := 15;;
gap> primes := Filtered(rg,IsPrime);
[ 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887 ]
gap> twins := Filtered(primes, p -> IsPrime(p+2));                                                              
[ 809, 821, 827, 857, 881 ]
gap> rgnp := Difference(rg,primes);
[ 800, 801, 802, 803, 804, 805, 806, 807, 808, 810, 812, 813, 814, 815, 816, 
  817, 818, 819, 820, 822, 824, 825, 826, 828, 830, 831, 832, 833, 834, 835, 
  836, 837, 838, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 
  852, 854, 855, 856, 858, 860, 861, 862, 864, 865, 866, 867, 868, 869, 870, 
  871, 872, 873, 874, 875, 876, 878, 879, 880, 882, 884, 885, 886, 888, 889, 
  890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900 ]
  
gap> arr := [primes,
> [1],
> Union(twins,twins+2),
> # now the non primes...
> Filtered(rgnp,u->(u mod 2)=0),
> Filtered(rgnp,u->(u mod 3)=0),
> Filtered(rgnp,u->(u mod 5)=0),
> [],[], # to avoid some colors
> Filtered(rgnp,u->(u mod 7)=0),
> Filtered(rgnp,u->(u mod 11)=0),
> Filtered(rgnp,u->(u mod 13)=0),
> Filtered(rgnp,u->(u mod 17)=0),
> Filtered(rgnp,u->(u mod 19)=0),
> Filtered(rgnp,u->(u mod 23)=0),
> Filtered(rgnp,u->(u mod 29)=0),
> Filtered(rgnp,u->(u mod 31)=0),
> Filtered(rgnp,u->(u mod 37)=0),
> Filtered(rgnp,u->(u mod 41)=0),
> Filtered(rgnp,u->(u mod 43)=0),
> Filtered(rgnp,u->(u mod 47)=0),
> Filtered(rgnp,u->(u mod 53)=0)];
[ [ 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887 
     ], [ 1 ], [ 809, 811, 821, 823, 827, 829, 857, 859, 881, 883 ], 
  [ 800, 802, 804, 806, 808, 810, 812, 814, 816, 818, 820, 822, 824, 826, 
      828, 830, 832, 834, 836, 838, 840, 842, 844, 846, 848, 850, 852, 854, 
      856, 858, 860, 862, 864, 866, 868, 870, 872, 874, 876, 878, 880, 882, 
      884, 886, 888, 890, 892, 894, 896, 898, 900 ], 
  [ 801, 804, 807, 810, 813, 816, 819, 822, 825, 828, 831, 834, 837, 840, 
      843, 846, 849, 852, 855, 858, 861, 864, 867, 870, 873, 876, 879, 882, 
      885, 888, 891, 894, 897, 900 ], 
  [ 800, 805, 810, 815, 820, 825, 830, 835, 840, 845, 850, 855, 860, 865, 
      870, 875, 880, 885, 890, 895, 900 ], [  ], [  ], 
  [ 805, 812, 819, 826, 833, 840, 847, 854, 861, 868, 875, 882, 889, 896 ], 
  [ 803, 814, 825, 836, 847, 858, 869, 880, 891 ], 
  [ 806, 819, 832, 845, 858, 871, 884, 897 ], [ 816, 833, 850, 867, 884 ], 
  [ 817, 836, 855, 874, 893 ], [ 805, 828, 851, 874, 897 ], 
  [ 812, 841, 870, 899 ], [ 806, 837, 868, 899 ], [ 814, 851, 888 ], 
  [ 820, 861 ], [ 817, 860 ], [ 846, 893 ], [ 848 ] ]
  

gap> a := 8;; b := 19;;  
gap> ns := NumericalSemigroup(a,b);;
gap> c := ConductorOfNumericalSemigroup(ns);;
gap> origin := 2*c-1;
251
gap> ground := [origin..origin+b-1];;
gap> 
gap> height:=2;;
gap> depth:=8;;
gap>   xaxis := [origin];;
gap>   for n in [1..b-1] do
>     Add(xaxis, origin+n*a);
>   od;
gap>   yaxis := [];;
gap>   for n in [-depth..height] do
>     Add(yaxis, origin+n*b);
>   od;
gap> 
gap> table := IP_TableWithModularOrder(origin,a,b,depth,height,false,false);;
gap> arr := [xaxis,yaxis,ground];
[ [ 251, 259, 267, 275, 283, 291, 299, 307, 315, 323, 331, 339, 347, 355, 363, 371, 379, 
      387, 395 ], [ 99, 118, 137, 156, 175, 194, 213, 232, 251, 270, 289 ], [ 251 .. 269 ] 
 ]
gap> tkz:=IP_TikzArrayOfIntegers(table,rec(highlights:=arr,shape_only:=true,
>              cell_width := "6",colsep:="1",rowsep:="1",inner_sep:="2",
>              line_color:="black!20", other := 
>   ["\\draw[postaction={draw,line width=1pt,red}] (-80pt,-8pt) rectangle (16pt,40pt);",
>   "\\draw[postaction={draw,line width=1pt,blue}] (-16pt,8pt) rectangle (80pt,-40pt);"]));;

#############################################################################
#############################################################################
# Examples from the paper "Conjecture of Wilf: a survey"
#
gap> ns := NumericalSemigroup(12, 19, 20, 22, 23, 26, 27, 28, 29);;
gap> cls := [ "blue","-red","red!70", "black!40" ];
[ "blue", "-red", "red!70", "black!40" ]
gap> P := MinimalGenerators(ns);
[ 12, 19, 20, 22, 23, 26, 27, 28, 29 ]
gap> m := Multiplicity(ns);
12
gap> c := Conductor(ns);
38
gap> q := CeilingOfRational(c/m);
4
gap> rho := q*m-c;
10
gap> list := [-rho .. c+m-1];
[ -10 .. 49 ]
gap> ti := [c..c+m-1];
[ 38 .. 49 ]
gap> importants := Union(SmallElements(ns),ti);
[ 0, 12, 19, 20, 22, 23, 24, 26, 27, 28, 29, 31, 32, 34, 35, 36, 38, 39, 40, 
  41, 42, 43, 44, 45, 46, 47, 48, 49 ]
gap> options := rec(colors := cls,highlights:=[[c],importants,P]);
rec( colors := [ "blue", "-red", "red!70", "black!40" ], 
  highlights := 
    [ [ 38 ], 
      [ 0, 12, 19, 20, 22, 23, 24, 26, 27, 28, 29, 31, 32, 34, 35, 36, 38, 
          39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49 ], 
      [ 12, 19, 20, 22, 23, 26, 27, 28, 29 ] ] )
gap> tkz := IP_TikzArrayOfIntegers(list,m,options);;
gap> Print(tkz);
%tikz
\begin{tikzpicture}[every node/.style={draw,scale=1pt,
minimum width=20pt,inner sep=3pt,
line width=0pt,draw=black}]
\matrix[row sep=2pt,column sep=2pt]
{\node[left color=blue,right color=-red]{38};&
\node[fill=-red]{39};&
\node[fill=-red]{40};&
\node[fill=-red]{41};&
\node[fill=-red]{42};&
\node[fill=-red]{43};&
\node[fill=-red]{44};&
\node[fill=-red]{45};&
\node[fill=-red]{46};&
\node[fill=-red]{47};&
\node[fill=-red]{48};&
\node[fill=-red]{49};\\
\node[left color=-red,right color=red!70]{26};&
\node[left color=-red,right color=red!70]{27};&
\node[left color=-red,right color=red!70]{28};&
\node[left color=-red,right color=red!70]{29};&
\node[]{30};&
\node[fill=-red]{31};&
\node[fill=-red]{32};&
\node[]{33};&
\node[fill=-red]{34};&
\node[fill=-red]{35};&
\node[fill=-red]{36};&
\node[]{37};\\
\node[]{14};&
\node[]{15};&
\node[]{16};&
\node[]{17};&
\node[]{18};&
\node[left color=-red,right color=red!70]{19};&
\node[left color=-red,right color=red!70]{20};&
\node[]{21};&
\node[left color=-red,right color=red!70]{22};&
\node[left color=-red,right color=red!70]{23};&
\node[fill=-red]{24};&
\node[]{25};\\
\node[]{2};&
\node[]{3};&
\node[]{4};&
\node[]{5};&
\node[]{6};&
\node[]{7};&
\node[]{8};&
\node[]{9};&
\node[]{10};&
\node[]{11};&
\node[left color=-red,right color=red!70]{12};&
\node[]{13};\\
\node[]{-10};&
\node[]{-9};&
\node[]{-8};&
\node[]{-7};&
\node[]{-6};&
\node[]{-5};&
\node[]{-4};&
\node[]{-3};&
\node[]{-2};&
\node[]{-1};&
\node[fill=-red]{0};&
\node[]{1};\\
};
\end{tikzpicture}
gap> options := rec(negatives := false, colors := cls,highlights:=[[c],importants,P]);
rec( colors := [ "blue", "-red", "red!70", "black!40" ], 
  highlights := 
    [ [ 38 ], [ 0, 12, 19, 20, 22, 23, 24, 26, 27, 28, 29, 31, 32, 34, 35, 36, 38, 39, 40, 41, 
          42, 43, 44, 45, 46, 47, 48, 49 ], [ 12, 19, 20, 22, 23, 26, 27, 28, 29 ] ], 
  negatives := false )
gap> tkz := IP_TikzArrayOfIntegers(list,m,options);;
gap> Print(tkz);
%tikz
\begin{tikzpicture}[every node/.style={draw,scale=1pt,
minimum width=20pt,inner sep=3pt,
line width=0pt,draw=black}]
\matrix[row sep=2pt,column sep=2pt]
{\node[left color=blue,right color=-red]{38};&
\node[fill=-red]{39};&
\node[fill=-red]{40};&
\node[fill=-red]{41};&
\node[fill=-red]{42};&
\node[fill=-red]{43};&
\node[fill=-red]{44};&
\node[fill=-red]{45};&
\node[fill=-red]{46};&
\node[fill=-red]{47};&
\node[fill=-red]{48};&
\node[fill=-red]{49};\\
\node[left color=-red,right color=red!70]{26};&
\node[left color=-red,right color=red!70]{27};&
\node[left color=-red,right color=red!70]{28};&
\node[left color=-red,right color=red!70]{29};&
\node[]{30};&
\node[fill=-red]{31};&
\node[fill=-red]{32};&
\node[]{33};&
\node[fill=-red]{34};&
\node[fill=-red]{35};&
\node[fill=-red]{36};&
\node[]{37};\\
\node[]{14};&
\node[]{15};&
\node[]{16};&
\node[]{17};&
\node[]{18};&
\node[left color=-red,right color=red!70]{19};&
\node[left color=-red,right color=red!70]{20};&
\node[]{21};&
\node[left color=-red,right color=red!70]{22};&
\node[left color=-red,right color=red!70]{23};&
\node[fill=-red]{24};&
\node[]{25};\\
\node[]{2};&
\node[]{3};&
\node[]{4};&
\node[]{5};&
\node[]{6};&
\node[]{7};&
\node[]{8};&
\node[]{9};&
\node[]{10};&
\node[]{11};&
\node[left color=-red,right color=red!70]{12};&
\node[]{13};\\
&
&
&
&
&
&
&
&
&
&
\node[fill=-red]{0};&
\node[]{1};\\
};
\end{tikzpicture}
gap> 

gap> STOP_TEST( "testall.tst", 10000 );
## The first argument of STOP_TEST should be the name of the test file.
## The number is a proportionality factor that is used to output a 
## "GAPstone" speed ranking after the file has been completely processed.
## For the files provided with the distribution this scaling is roughly 
## equalized to yield the same numbers as produced by the test file 
## tst/combinat.tst. For package tests, you may leave it unchnaged. 

#############################################################################
##
#E
