ReadPackage("intpic", "gap/ip_display.gd");
ReadPackage("intpic", "gap/ip_colors.gd");
ReadPackage("intpic", "gap/ip_options.gd");
ReadPackage("intpic", "gap/ip_tikz.gd");
ReadPackage("intpic", "gap/ip_dot.gd");
ReadPackage("intpic", "gap/ip_utils.gd");
ReadPackage("intpic", "gap/ip_tables.gd");
ReadPackage("intpic", "gap/ip_routines_for_NS.gd");

#
#if not TestPackageAvailability("viz", "0.2.5")=fail then 
#  LoadPackage("viz");
#fi;
DeclareInfoClass("InfoViz");

DeclareInfoClass("InfoIntPic");
