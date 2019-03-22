<html>
<body>
<form method="post" action="file_uploader_mapping_qc.php" enctype="multipart/form-data"> 	
	Path to Fastq files: <input type="text" name="path"/><img src="/pic/1506480352523.gif" align="right" width="700" height="550"><br><br>
	Organism:<br>
        <input type="radio" name="org" value="Human" checked>Human<br>
        <input type="radio" name="org" value="Mouse">Mouse<br>
        <input type="radio" name="org" value="Rat">Rat<br>
        <input type="radio" name="org" value="Others">Others<br>
	<br>
	Sequencing Type:<br>
        <input type="radio" name="sequencing_type" value="SE" checked>SE<br>
        <input type="radio" name="sequencing_type" value="PE">PE<br>
        <input type="radio" name="sequencing_type" value="scRNA_10X">10X_scRNA<br>
        <input type="radio" name="sequencing_type" value="Others">Others<br>
        <br>
	Project Name: <input type="text" name="project_name"><br>
	<br>
	Email: <input type="text" name="email"><br>
	<br>
	Perfomr QC? 
	<br>
	<input type="radio" name="qc" value="yes">Yes
	<input type="radio" name="qc" value="no" checked>No<br>

	<br><br>
        <input type="submit" value="Submit"/>
	</form>
  
</body>
</html>

