$SOURCE = "."
$OUTDIR = "dist"
$MAINFILE = "document"
$EXTRA_MEM = 2000000

if (($Args[0] -eq $null) -or ($Args[0] -eq "build"))    {
    echo "build"

    xelatex --extra-mem-top="$($EXTRA_MEM)" -output-directory="$($OUTDIR)" "$($MAINFILE).tex"
    xelatex --extra-mem-top="$($EXTRA_MEM)" -output-directory="$($OUTDIR)" "$($MAINFILE).tex"
    makeglossaries.exe -d "$($OUTDIR)" "$($MAINFILE)"
    biber --output-directory "$($OUTDIR)" "$($MAINFILE)"
    xelatex --extra-mem-top="$($EXTRA_MEM)" -output-directory="$($OUTDIR)" "$($MAINFILE).tex"
    xelatex --shell-escape --extra-mem-top="$($EXTRA_MEM)" -output-directory="$($OUTDIR)" "$($MAINFILE).tex"

}   elseif($Args[0] -eq "clean")   {

    Remove-Item -Path $OUTDIR

}
exit
