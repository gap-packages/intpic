#############################################################################
##  
##  PackageInfo.g for the package `IntPic'              Manuel Delgado
##                                                    

SetPackageInfo( rec(

PackageName := "IntPic",
Subtitle := "A package for drawing integers",
Version := "0.2.3",
Date := "14/09/2017",
        
##  Information about authors and maintainers.
Persons := [
 rec(
    LastName      := "Delgado",
    FirstNames    := "Manuel",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "mdelgado@fc.up.pt",
    WWWHome       := "http://www.fc.up.pt/cmup/mdelgado/",
    PostalAddress := Concatenation( [
                   "Departamento de Matemática - Faculdade de Ciências\n",
                   "Porto\n",
                   "Portugal" ] ),
    Place         := "Porto",
    Institution   := "Faculdade de Ciências"
           )
            ],

Status := "deposited",       

SourceRepository := rec(
  Type := "git",
  URL := "https://github.com/gap-packages/intpic"
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://gap-packages.github.io/intpic",
README_URL      := Concatenation( ~.PackageWWWHome, "/README" ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),
ArchiveFormats := ".tar.gz",
        
AbstractHTML := 
   "The <span class=\"pkgname\">IntPic</span> package, is a package for drawing integers, by emphasizing some subsets.",
                   

PackageDoc := rec(
  BookName  := "IntPic",
  ArchiveURLSubset := ["doc","images"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "IntPic, a GAP package for drawing integers",
),
                   
Dependencies := rec(
  GAP := "4.7",
  NeededOtherPackages := [["numericalsgps", "1.0"], ["GAPDoc", "1.5"]],
  SuggestedOtherPackages := [],
  ExternalConditions := []

),

AvailabilityTest := ReturnTrue,
BannerString := Concatenation( 
  "----------------------------------------------------------------\n",
  "Loading  IntPic ", ~.Version, " (drawing integers)\n",
  "by ", ~.Persons[1].FirstNames, " ", ~.Persons[1].LastName,
        " (", ~.Persons[1].WWWHome, ")\n",
#  "   ", ~.Persons[2].FirstNames, " ", ~.Persons[2].LastName,"\n",
#        " (", ~.Persons[2].WWWHome, ")\n",
#  "   ", ~.Persons[3].FirstNames, " ", ~.Persons[3].LastName,
#        " (", ~.Persons[3].WWWHome, ")\n",
  "For help, type: ?IntPic;\n",
  "----------------------------------------------------------------\n" ),

TestFile := "tst/testall.tst",

Keywords := ["emphasize", "highlight", "draw", "integer", "picture"]

                    ));
