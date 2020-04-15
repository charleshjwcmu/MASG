echo "Generate PDF report with LaTeX!"
set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_04_15_2_52_17_PM
cd /D %root%
for %%a in (
FixedIncome
	Equity
	Commodity
) do (
	pdflatex -interaction=nonstopmode "\def\ac{%%a} \input{ProductPackageShortVersion_%%a.tex}"
	pdflatex -interaction=nonstopmode "\def\ac{%%a} \input{ProductPackageShortVersion_%%a.tex}"
)
