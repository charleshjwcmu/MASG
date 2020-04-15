echo "Generate PDF report with LaTeX!"
set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_02_23_7_29_16_PM
cd /D %root%
for %%a in (
FixedIncome
	Equity
	Commodity
) do (
	pdflatex -interaction=nonstopmode "\def\ac{%%a} \input{ProductPackageShortVersion_%%a.tex}"
	pdflatex -interaction=nonstopmode "\def\ac{%%a} \input{ProductPackageShortVersion_%%a.tex}"
)
