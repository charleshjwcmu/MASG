set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_02_09_8_50_05_PM
cd /D %root%
echo "Generate PDF report with LaTeX!"
for %%a in (
FixedIncome
	Equity
	Commodity
) do (
	pdflatex -interaction=nonstopmode "\def\ac{%%a} \input{ProductPackage_%%a.tex}"
	pdflatex -interaction=nonstopmode "\def\ac{%%a} \input{ProductPackage_%%a.tex}"
)
