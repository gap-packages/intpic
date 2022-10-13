##########################################################################
# producing tikz code for drawing numerical semigroups
# The argument is: 
#* a numerical semigroup, 
#*(optional) a list whose elements are either 
###- lists of integers or 
###- one of the strings "pseudo_frobenius", "min_generators", "frobenius_number", "conductor", "special_gaps", "fundamental_gaps", "small_elements" (the default: used when no list is present), "ns_table"
#####- a record whose fields are:
#####- ns_table (can have the values true or false; the default is false) 
#####- colors (a list of colors that will be the first to be taken, the default being [])

######-(optional) argument -- an argument (that may be a function name also)
#### Warning: When a string is misspelled, an ERROR may be signaled#######

#*(optional) a positive integer -- if it is bigger than the conductor or biggest minimal generator, it indicates the number of cells - 1 to be drawn and these are drawn in a single line; otherwise, it indicates the maximum number of cells per line.
#example
#TikzCodeForNumericalSemigroup(ns,[[3,4],"pseudo_frobenius"],20);
##
# 

InstallGlobalFunction(TikzCodeForNumericalSemigroup,
        function(arg)
  local  ns, m, 
         small, c, gen, mg, options, opt, allowed_options_list, o, q, rho, 
         list, ti, array, len, flen, str, ev, x;
  
  ns := First(arg, IsNumericalSemigroup);
  #a global variable is needed to EvalString...
  AuxiliaryGlobalVariableForTikzCodeForNumericalSemigroup := ns;

  m := Multiplicity(ns);
  small := SmallElements(ns);
  c := Conductor(ns);
  gen := MinimalGenerators(ns);
  mg := Maximum(gen);

  options := ShallowCopy(First(arg, IsList));
  if options = fail then
    options := [];
  elif Length(options) > 1 and IsString(options) then
    options := [options];    
  fi;
  
  allowed_options_list := ["pseudo_frobenius", "min_generators", "frobenius_number", "conductor", "special_gaps", "fundamental_gaps", "small_elements", "ns_table"];  
  for o in options do
    if IsString(o) and not (o in allowed_options_list) then
      Info(InfoWarning,1,"The option ", o, " is perhaps misspelled and will be ignored\n");
      #, unless it is the name of a function, it will cause an error to be signaled.");
    fi;
  od;

  if First(arg, a -> IsRecord(a)) <> fail then
    opt :=  StructuralCopy(First(arg, a -> IsRecord(a)));
    if not IsBound(opt.ns_table) then
      opt.ns_table := false;
    fi;
    if not IsBound(opt.colors) then
      opt.colors := [];
    fi;
  else
    opt := rec(ns_table := false, colors := []);
  fi;

  if ("ns_table" in options) then
    opt.ns_table := true;
  fi;
 
  if opt.ns_table then
    q := CeilingOfRational(c/m);
    rho := q*m-c;
    list := [-rho .. c+m-1];
    ti := [c..c+m-1]; #threshold interval
    small := Union(small,ti);
    array := [];
  else
    len := First(arg, IsInt);
    if len = fail then
      len := c;
    fi;
    flen := Maximum(len,c);
    small := Union(small, [c..flen]);
    array := [];
  fi;

  #          Error("..");
  for o in options do
    if IsHomogeneousList(o) and IsInt(o[1]) then
      Add(array,o);
    elif o = "pseudo_frobenius" then
      Add(array, PseudoFrobeniusOfNumericalSemigroup(ns));
    elif o = "small_elements" then
      Add(array,small);
    elif o = "min_generators" then
      Add(array,gen);
    elif o = "frobenius_number" then
      Add(array,[c-1]);
    elif o = "conductor" then
      Add(array,[c]);
    elif o = "special_gaps" then
      Add(array, SpecialGapsOfNumericalSemigroup(ns));
    elif o = "fundamental_gaps" then
      Add(array, FundamentalGapsOfNumericalSemigroup(ns));
    elif IsRecord(o) then

      if IsBound(o.func) and IsFunction(EvalString(o.func)) then
        if IsBound(o.argument) then
          if IsFunction(EvalString(o.argument)) then
            str := Concatenation(o.argument,"(AuxiliaryGlobalVariableForTikzCodeForNumericalSemigroup)");
            ev := EvalString(str);
            str := Concatenation(o.func,"(",String(ev),")");
          else
            str := Concatenation(o.func,"(",o.argument,")");
          fi;
        else
          str := Concatenation(o,"(AuxiliaryGlobalVariableForTikzCodeForNumericalSemigroup)");
        fi;
        x := EvalString(str);
        if IsTable(x) then
          Append(array, x);
        elif IsList(x) then
          Add(array, x);
        elif IsInt(x) then
          Add(array,[x]);
        else
          Error("the function ", str, " should return an integer or a list of integers\n");
        fi;
      fi;
    fi;
  od;
  if array = [] then
#    array := Union(small,ti);
    Info(InfoWarning,1,"In order to highlight some element, please use a list with one or more of the options given as strings: ", "pseudo_frobenius, ", "min_generators, ", "frobenius_number, ", "conductor, ", "special_gaps, ", "fundamental_gaps, ", "small_elements\n");
  fi;
  if opt.ns_table then
    if IsBound(opt.negatives) then
      return IP_TikzArrayOfIntegers(list,m,rec(highlights:=array,negatives:=opt.negatives,colors := opt.colors));
    fi;
    return IP_TikzArrayOfIntegers(list,m,rec(highlights:=array,colors := opt.colors));
  fi;
  flen := Maximum(len,Maximum(Flat(array)));
  return IP_TikzArrayOfIntegers([0..flen],len+1,rec(highlights:=array,colors := opt.colors));
end);

##########################################################################
# This function abbreviates the production of tikz code with some natural options and displays the image produced. Note that the production and displaying of the image depends on the function IP_Splash (which can be slow and depends on an appropriate configuration of the system). 
 
InstallGlobalFunction(DrawNumericalSemigroup,
        function(ns)  
  local highlights, options, tkz;

  highlights := ["conductor", "min_generators", "small_elements"];
  options := rec(negatives := false, ns_table:=true,colors:=["blue", "red!70", "-red", "black!40"]);
  tkz := TikzCodeForNumericalSemigroup(ns,highlights,options);
  IP_Splash(tkz);
  return tkz;
end);

##########################################################################
# This function is used to produce lists of numerical semigroups with a fixed genus or Frobenius number. They are filtered and ordered according to some criteria.
#The possible fields of the record of options:
# *  set (a record whose possible fields are genus or frobenius )
# *(optional)  filter (a record whose possible fields are genus, type and/or multiplicity and/or frobenius and/or embedding_dimension)
# *(optional)  order ("genus", "type", "multiplicity", "frobenius", "embedding_dimension")
  #
  #example
  #SetOfNumericalSemigroups(rec(set:=rec(genus:=13),filter:=rec(type:= 2),order:="multiplicity"));

InstallGlobalFunction(SetOfNumericalSemigroups,
        function(opt)
  local  options, universe, aux_list, ordered_list;

  if IsRecord(opt) then
    options := opt;
  else
    Error("The argument must be a record (of options)");
  fi;

  # note that the field "set" must be present
  if IsBound(options.set.frobenius) then 
    universe := NumericalSemigroupsWithFrobeniusNumber(options.set.frobenius);
  else
    universe := NumericalSemigroupsWithGenus(options.set.genus);
  fi;

  ## filtering
  if IsBound(options.filter) then
    if IsBound(options.filter.genus) then
      universe := Filtered(universe, s -> GenusOfNumericalSemigroup(s) = options.filter.genus);
    fi;      
    if IsBound(options.filter.type) then
      universe := Filtered(universe, s -> TypeOfNumericalSemigroup(s) = options.filter.type);
    fi;      
    if IsBound(options.filter.frobenius) then
      universe := Filtered(universe, s -> FrobeniusNumberOfNumericalSemigroup(s) = options.filter.frobenius);
    fi;      
    if IsBound(options.filter.multiplicity) then
      universe := Filtered(universe, s -> MultiplicityOfNumericalSemigroup(s) = options.filter.multiplicity);
    fi;
    if IsBound(options.filter.embedding_dimension) then
      universe := Filtered(universe, s -> EmbeddingDimensionOfNumericalSemigroup(s) = options.filter.embedding_dimension);
    fi;
  fi;

  #ordering
  if IsBound(options.order) then
    if options.order = "embedding_dimension" then
      aux_list := List(universe, s-> [EmbeddingDimensionOfNumericalSemigroup(s),s]);
      ordered_list := List(Set(aux_list), l -> l[2]);
    elif options.order = "frobenius" then
      aux_list := List(universe, s-> [FrobeniusNumberOfNumericalSemigroup(s),s]);
      ordered_list := List(Set(aux_list), l -> l[2]);
    elif options.order = "pseudo_frobenius" then
      aux_list := List(universe, s-> [PseudoFrobeniusOfNumericalSemigroup(s),s]);
      ordered_list := List(Set(aux_list), l -> l[2]);
    elif options.order = "type" then
      aux_list := List(universe, s-> [TypeOfNumericalSemigroup(s),s]);
      ordered_list := List(Set(aux_list), l -> l[2]);
    elif options.order = "genus" then
      aux_list := List(universe, s-> [GenusOfNumericalSemigroup(s),s]);
      ordered_list := List(Set(aux_list), l -> l[2]);
    elif options.order = "multiplicity" then
      aux_list := List(universe, s-> [MultiplicityOfNumericalSemigroup(s),s]);
      ordered_list := List(Set(aux_list), l -> l[2]);
    else
      ordered_list := universe;
    fi;
  else
    ordered_list := universe;
  fi;
  return ordered_list;
end);

  ############################################################################
  # Produces a single image from the images of a set of numerical semigroups
  #
  # arguments
  #* a list of numerical semigroups
  #*(optional) an integer that (when present) determines the length of each line
  #*(optional) a record with fields:
  ### -(optional) splash: which (when present) consists of a record of options for the Viz Splash function 
  ### -(optional) highlights: a list to be passed to the function that produces the tikz code for each individual semigroup (whose aim is to say which elements are to be highlighted) 
  #example
# ns1 := NumericalSemigroup(3,5);;
# ns2 := NumericalSemigroup(5,7,11);;
# DrawSetOfNumericalSemigroups(ns1,rec(splash:= rec(viewer := "evince"),highlights := ["pseudo_frobenius","small_elements","min_generators"]));
#DrawSetOfNumericalSemigroups(ns1,ns2,rec(splash:= rec(viewer := "evince"),highlights := ["pseudo_frobenius","small_elements","min_generators"]));
#DrawSetOfNumericalSemigroups([ns1,ns2],rec(splash:= rec(viewer := "evince"),highlights := ["pseudo_frobenius","small_elements","min_generators"]));

InstallGlobalFunction(DrawSetOfNumericalSemigroups,
        function(arg)  
  local  set, options, mm, ns, m, line_length, tk, i;
  
  set := Filtered(arg,IsNumericalSemigroup);
  if set = [] then
    set := First(arg,s -> IsHomogeneousList(s) and IsNumericalSemigroup(s[1]));
  fi;
  
  # if  First(arg,IsNumericalSemigroup) <> fail then
  #   set := [First(arg,IsNumericalSemigroup)];
  # else 
  #   set := First(arg,s -> IsHomogeneousList(s) and IsNumericalSemigroup(s[1]));
  # fi;
  
  line_length := First(arg,IsInt);
  options := First(arg,IsRecord);
  if options = fail then
    options := rec();
  fi;
  #determining the maximum of the minimal generators and the conductors
  mm := 0;
  for ns in set do
    m := Maximum(Union(MinimalGeneratingSystemOfNumericalSemigroup(ns),[ConductorOfNumericalSemigroup(ns)]));
    mm := Maximum(m,mm);
  od;
  if line_length = fail then
    line_length := mm;
  fi;

  tk := "";
  if IsBound(options.highlights) then
    tk := Concatenation(tk,TikzCodeForNumericalSemigroup(set[1],options.highlights, line_length));
    if Length(set) > 1 then 
      for i in [2..Length(set)] do
        tk := Concatenation(tk,"\\\\\n",TikzCodeForNumericalSemigroup(set[i],options.highlights, line_length));
      od;
    fi;
  else
    tk := Concatenation(tk,TikzCodeForNumericalSemigroup(set[1], line_length));
    if Length(set) > 1 then 
      for i in [2..Length(set)] do
        tk := Concatenation(tk,"\\\\\n",TikzCodeForNumericalSemigroup(set[i], line_length));
      od;
    fi;
  fi;

  if IsBound(options.splash) then
    IP_Splash(tk,options.splash);
  else
    IP_Splash(tk);
  fi;
end);
######

