set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_04_15_2_52_17_PM
cd /D %root%
echo "Generate PDF report with LaTeX!"
for %%a in (
	Commodity
) do (
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a "\def\ac{%%a} \input{ProductPackage.tex}"
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a "\def\ac{%%a} \input{ProductPackage.tex}"
)
