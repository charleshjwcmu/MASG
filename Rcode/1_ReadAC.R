# Read CSI data from database on monthly basis
#	compare CSI data with prior version to identify data errors
# 
###############################################################################
Output_curve = file.path(OutputRoot,"CurveInfo")

##Read and Update Mapping Table
I_MOD_CSI_AC <- mapping
file_name = paste(Output_curve,"/MAP_CURVE_MODEL.tex",sep="")
print(xtable(I_MOD_CSI_AC[,!grepl("MOD_ID",colnames(mapping))],caption="Asset Class and Indices"),file=file_name, tabular.environment = 'longtable', floating=FALSE, include.rownames=FALSE)

#process csi data to required format
CSI_CURVES <- extract_ts_from_df(read.csv(file_name_ac),date_column = "DATE",value_column = "CSI_VALUE",name_column = "CSI_ID")

#####################Creat secondary variables
table_name <- "I_CSI_SEC";
print("****************create secondary CSI*******************")
SecTable <- read.xlsx(concat_file_path(tableFilter(list_files,"VariableName","D_AC_SEC")),sheetIndex=1)

SecTable <- SecTable[!is.na(SecTable$CSI_ID),]
SecTable[is.na(SecTable)] = ""
SecTable <- characterizeTable(SecTable)
if (!all(SecTable$INPUT1%in%names(CSI_CURVES)) | !all(SecTable$INPUT2%in%names(CSI_CURVES))) {
	stop("ERROR: some CSI defined in secondary table do not exist")
}

CSI_HIST_SEC <- data.frame()
for (i in 1:nrow(SecTable)) {
	#	i <- 1
	var_names <- as.character(unlist(SecTable[i,c("INPUT1","INPUT2","INPUT3")]))
	var_names <- as.character(var_names[var_names!=""])
	curves <- na.omit(combineCurves(CSI_CURVES[var_names]))
	colnames(curves) <- paste0("INPUT",1:ncol(curves))
	data <- eval(parse(text=as.character(SecTable[i,]$FORMULA)), as.data.frame(curves))
	csi_id <- as.character(SecTable[i,"CSI_ID"])
	date <- convertNumericToDate(index(curves))
	CSI_HIST_SEC <- rbind(CSI_HIST_SEC, data.frame(date,csi_id,data))
}
colnames(CSI_HIST_SEC) <- c("DATE","CSI_ID","CSI_VALUE")
CSI_HIST_SEC$DATE <- format(CSI_HIST_SEC$DATE,"%m/%d/%Y")
CSI_HIST_SEC <- extract_ts_from_df(CSI_HIST_SEC,date_column = "DATE",value_column = "CSI_VALUE",name_column = "CSI_ID")

CSI_CURVES = append(CSI_CURVES, CSI_HIST_SEC)
#CSI_CURVES = CSI_HIST_SEC
CSI_NAMES_ALL <- names(CSI_CURVES)
CSI_HIST_SEC = NULL
#save records to tex file for presentation purpose
csi_names <- names(CSI_CURVES)
fileConn <- file(paste(Output_curve,"/Curves.tex",sep=""),"w")
writeLines(paste0("\\newcommand\\Curves{",paste(csi_names,collapse=","),"}"), fileConn)
writeLines(paste0("\\newcommand\\CurrentVersion{",current_version,"}"), fileConn)
close(fileConn)

#Plot Curves
if (OUTPUT_CSI_PLOT) {
	for(i in 1:length(csi_names)) {
		#	i = 16;
		file_name = paste(Output_curve,"/",csi_names[i],".png",sep="")
		png(file_name,width=600,height=400)
		ts.plot(na.omit(CSI_CURVES[[i]]),ylab=csi_names[i], main=paste0("CSI_ID: ",csi_names[i]),type="b")
		dev.off()
	}
}
