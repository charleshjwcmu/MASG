set root=C:\Users\huang\workspace\MASG/PDFReport_FI/2020_02_09_10_12_04_AM
cd /D %root%
pdflatex -interaction=nonstopmode -jobname=Forecast_Report_%date:~10,4%_%date:~4,2%_%date:~7,2% Forecast_document.tex
pdflatex -interaction=nonstopmode -jobname=Forecast_Report_%date:~10,4%_%date:~4,2%_%date:~7,2% Forecast_document.tex
