<HTML>
<HEAD>
<style type="text/css">
table{
        width: 50%;
        margin-bottom: 20px;
                border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
</style>

	<SCRIPT language="javascript">
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var colCount = table.rows[1].cells.length;
			console.log(table);
			console.log(rowCount);
			console.log(row);
			console.log(colCount);
			for(var i=0; i<colCount; i++) {

				var newcell	= row.insertCell(i);

				newcell.innerHTML = table.rows[1].cells[i].innerHTML;
				//alert(newcell.childNodes);
				switch(newcell.childNodes[0].type) {
					case "text":
							newcell.childNodes[0].value = "";
							break;
					case "checkbox":
							newcell.childNodes[0].checked = false;
							break;
					case "select-one":
							newcell.childNodes[0].selectedIndex = 0;
							break;
				}
			}
		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					if(rowCount <= 1) {
						alert("Cannot delete all the rows.");
						break;
					}
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}

	</SCRIPT>
</HEAD>
<BODY>
	<form action="file_uploader.php" method="post" enctype="multipart/form-data">
	<h3> NextSeq SampleSheet and Raw Data Processing System </h3>
	Sequencing Run ID: <input type="text" name="run_ID"/><img src="/pic/1506480352523.gif" align="right" width="700" height="550"><br><br>
	
	<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />

	<INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />

	<TABLE id="dataTable" width="350px" border="1">
		<thead>
		<TR>
			<th>Select</th>
			<th>PI_LastName</th>
                	<th>PI_FirstName</th>
			<th>ProjectID</th>
                	<th>Sequencing_Type</th>
			<th>Organism</th>
		</TR>
		</thead>
		<tbody>
		<TR>
			<TD><INPUT type="checkbox" name="chk[]"/></TD>
			
			<TD><INPUT type="text" name="PI_Last[]"/></TD>
			<TD><INPUT type="text" name="PI_First[]"/></TD>
			<TD><INPUT type="text" name="ProjectID[]"/></TD>
			<TD>
				<SELECT name="Sequencing_Type[]">
					<OPTION value="scRNA_10X">10X scRNA</OPTION>
					<OPTION value="V(D)J_RNA_10X">10X V(D)JRNA</OPTION>
					<OPTION value="Total_RNA">Total RNA</OPTION>
					<OPTION value="mRNA">mRNA</OPTION>
					<OPTION value="scRNA">scRNA</OPTION>
					<OPTION value="miRNA">miRNA</OPTION>
					<OPTION value="ATAC">ATAC</OPTION>
				</SELECT>
			</TD>
			<TD>
				<SELECT name="Organism[]">
					<OPTION value="Human">Human</OPTION>
					<OPTION value="Mouse">Mouse</OPTION>
					<OPTION value="Rat">Rat</OPTION>
					<OPTION value="Others">Others</OPTION>
				</SELECT>
			</TD>
		</TR>
		</tbody>
	</TABLE>
<br><br>
        Fastq Genertion: <input type="radio" name="fastq_ge" value="Yes">Yes <input type="radio" name="fastq_ge" value="No" checked />No<br><br>
        Sample Sheet(.csv):<br/>
        <input type="file" name="uploaded_file" id="file"/><br/>
        <br><br>	
	Comments:<br>
        <textarea cols="35" rows="6" name="comments">
        </textarea><br><br>
	<input type="submit" name="submit" value="Submit"></button>

<h3>Guidance for SampleSheet format</h3>
<p>1. Make sure the column "Sample Project", "Sample ID" present and no blank rows, no matter the sample sheet is generated from IEM or BaseSpace;<p>
<p>2. Make sure the ID for "Sample Project" for each project is consistent and no weird symbols present in the ID (such as @#!$?...)</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; - You can copy the ID into "Notepad"(PC) or "TextEdit" (macOS) as plain text to check the present of invisible weird symbols;</p>
<p>3. Only letters, numbers and "-","_" allowed in "Sample ID";
<p>4. Please rename the sample sheet into "SampleSheet.csv" for uploading;
<p>5. Once you made a successful submission, please don't submit the next one until you recive the email notification that the previous one has been finished; 
<p>6. If you keep receiving the error message, please contact yizhou.wang@cshs.org;
<p>7. Make sure the sample index has the same length for each sample</p>
<h3>Process</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; - One copy of samplesheet will be renamed into "SampleSheet.csv" and uploaded to sequencing run folder to initialize the Fastq generation (bcl2fastq);</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; - One copy of samplesheet will be renamed into "&lt;sequencingID&gt;_&lt;projectID&gt;_&lt;PIname_&lt;sequencingtype&gt;.csv" and uploaded to sample sheets back up folder;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; - Two emails are expected: one is to inform that the sample sheet has been uploaded successfully and the summary information of the sequencing run; the other one is to inform that Fastq generation is done and the summary of demultiplexing.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; - If it is "Sequencing Only" service, please notify in comment box.</p>

</BODY>
</HTML>

