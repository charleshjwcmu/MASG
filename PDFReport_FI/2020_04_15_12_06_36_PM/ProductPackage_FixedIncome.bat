set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_04_15_12_06_36_PM
cd /D %root%
echo "Generate PDF report with LaTeX!"
for %%a in (
	FixedIncome
) do (
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a "\def\ac{%%a} \input{ProductPackage.tex}"
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a "\def\ac{%%a} \input{ProductPackage.tex}"
)
