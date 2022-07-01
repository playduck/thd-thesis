$SOURCE = "."
$OUTDIR = "dist"
$MAINFILE = "document"

if (($Args[0] -eq $null) -or ($Args[0] -eq "build"))    {
    echo "build"

    New-Item -Path $OUTDIR -ItemType Directory -Force
    Get-ChildItem -Path $SOURCE -Exclude $OUTDIR | Copy-Item -Destination $OUTDIR -Recurse -Container -Exclude "*.*"

    xelatex --extra-mem-top=2000000 -output-directory="$($OUTDIR)" "$($MAINFILE).tex"
    xelatex --extra-mem-top=2000000 -output-directory="$($OUTDIR)" "$($MAINFILE).tex"
    makeglossaries.exe -d "$($OUTDIR)" "$($MAINFILE)"
    biber --output-directory "$($OUTDIR)" "$($MAINFILE)"
    xelatex --extra-mem-top=2000000 -output-directory="$($OUTDIR)" "$($MAINFILE).tex"
    xelatex --shell-escape --extra-mem-top=2000000 -output-directory="$($OUTDIR)" "$($MAINFILE).tex"

}   elseif($Args[0] -eq "clean")   {

    Remove-Item -Path $OUTDIR

}
exit

# Für Mr Sven:
# xelatex --extra-mem-top=2000000 -output-directory="dist" "document.tex"
