set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_02_08_10_53_01_PM
cd /D %root%
echo "Generate PDF report with LaTeX!"
for %%a in (
	Agricultural
) do (
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a_%date:~10,4%_%date:~4,2%_%date:~7,2% "\def\ac{%%a} \input{ProductPackage.tex}"
	pdflatex -interaction=nonstopmode -jobname=ProductPackage_%%a_%date:~10,4%_%date:~4,2%_%date:~7,2% "\def\ac{%%a} \input{ProductPackage.tex}"
)
