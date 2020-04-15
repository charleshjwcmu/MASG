set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_02_08_10_53_01_PM
cd /D %root%
pdflatex -interaction=nonstopmode -jobname=PCA_Report_%date:~10,4%_%date:~4,2%_%date:~7,2% PCA_document.tex
pdflatex -interaction=nonstopmode -jobname=PCA_Report_%date:~10,4%_%date:~4,2%_%date:~7,2% PCA_document.tex
