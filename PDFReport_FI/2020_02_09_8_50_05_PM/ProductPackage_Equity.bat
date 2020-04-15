set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_02_09_8_50_05_PM
cd /D %root%
echo "Generate PDF report with LaTeX!"
for %%a in (
	Equity
) do (
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a "\def\ac{%%a} \input{ProductPackage.tex}"
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a "\def\ac{%%a} \input{ProductPackage.tex}"
)
