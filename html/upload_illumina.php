<html>
<body>
<form action="file_uploader_illumina.php" method="post" enctype="multipart/form-data">
	Sequencing Run: <input type="text" name="run_ID" /><img src="/pic/1506480352523.gif" align="right" width="700" height="550"><br><br>
	Date: <input type="date" name="date"  /><br><br>
	Loading Concentration(%): <input type="text" name="loading_con" /><br><br>
	PhiX Concentration(%): <input type="text" name="phix_con" /><br><br>
	Sequencing Type:<br>
        <input type="radio" name="seq_type"  value="Single-end">Single-end<br>
        <input type="radio" name="seq_type"  value="Paired-end">Paired-end<br>
        <input type="radio" name="seq_type"  value="scRNA_10X">10X scRNA<br><br>
	Kit:<br>
        <input type="radio" name="kit" value="150 High (26,98 run)">150 High (26,98 run)<br>
        <input type="radio" name="kit" value="2x150 (High)">2x150 (High)<br>
        <input type="radio" name="kit" value="1x75 High">1x75 High<br>
        <input type="radio" name="kit" value="2x75 Mid">2x75 Mid<br><br>
	Performed by:<br>	      
        <input type="checkbox" name="check_list[ ]" value="AS">AS<br>
  	<input type="checkbox" name="check_list[ ]" value="CS">CS<br> 
  	<input type="checkbox" name="check_list[ ]" value="EG">EG<br> 
	<br><br>
	Notes:<br>
	<textarea name="notes" rows="10" cols="30">
	</textarea>
	<br><br>
	Illumina stat summary(.txt saving with <strong>UTF-8 codes</strong> and <strong>no space in file name!</strong>):
	<br>
        <input name="uploaded_file" type="file"/><br/>
        <br><br>
        <input type="submit" value="Submit"/>
</body>
</html>

