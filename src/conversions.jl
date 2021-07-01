function LoadPackage(pkgname::String)
    GAP.LoadPackageAndExposeGlobals(pkgname, Main, all_globals = true)
end

export LoadPackage

function HomalgMatrix(M::Any, m::Int64, n::Int64, R::GAP.GapObj)
    return GAP.Globals.HomalgMatrix(GAP.Globals.ConvertJuliaToGAP(M), m, n, R)
end

function HomalgMatrix(M::Any, R::GAP.GapObj)
    return GAP.Globals.HomalgMatrix(GAP.Globals.ConvertJuliaToGAP(M), R)
end

export HomalgMatrix

function RepresentationCategoryObject(char::GAP.GapObj, category::GAP.GapObj, name::String)
    return GAP.Globals.RepresentationCategoryObject(char, category, julia_to_gap(name))
end

export RepresentationCategoryObject

function SizeScreen()
    return gap_to_julia(GAP.Globals.SizeScreen())
end

function SizeScreen(L::Array)
    return gap_to_julia(GAP.Globals.SizeScreen(julia_to_gap(L)))
end

export SizeScreen

## used in ../bin/gap-with-cap-and-homalg-via-julia
global SIZE_SCREEN_ORIGINAL = SizeScreen()

export SIZE_SCREEN_ORIGINAL
