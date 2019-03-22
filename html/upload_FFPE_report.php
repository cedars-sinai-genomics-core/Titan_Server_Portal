<html>
<body>
<form method="post" action="file_uploader_FFPE_report.php" enctype="multipart/form-data"> 	
	Path to Fastq files: <input type="text" name="path"/><img src="/pic/1506480352523.gif" align="right" width="700" height="550"><br><br>
	Project ID: <input type="text" name="project_name"><br>
        <input type="submit" value="Submit"/>
	</form>

<h3>Guidance for BlueBee Report Generator</h3>
<p>1. Run the BlueBee pipeline using BlueBee online portal and downloaded all of results and uploaded to HPC;<p>
<p>2. Results would include (1)count expression matrix (2)Reads distribution stats (3)Alignment stats from STAR (4)fastqQC report (5) BAM files</p>
<p>3. Input the path where you uploaded the folders of results and project ID on server portal, then click "Submit";<p>
<p>4. A multiQC report and a combined count expression matrix with project ID as prefix will be generated; these could be delivered together with FASTQ fiels<p>

</body>
</html>

