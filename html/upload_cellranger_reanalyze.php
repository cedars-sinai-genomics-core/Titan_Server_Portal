<HTML>
<HEAD>
<style type="text/css">
table{
        width: 20%;
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
	<form action="file_uploader_cellranger_reanalyze.php" method="post" enctype="multipart/form-data">
	<h3> CellRanger Reanalyze System </h3>
	Path to Results Folder: <input type="text" name="path_fastq"/><img src="/pic/1506480352523.gif" align="right" width="700" height="550"><br><br>
	
	<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />

	<INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />

	<TABLE id="dataTable" width="350px" border="1">
		<thead>
		<TR>
			<th>Select</th>
			<th>Sample Name</th>
		</TR>
		</thead>
		<tbody>
		<TR>
			<TD><INPUT type="checkbox" name="chk[]"/></TD>
			
			<TD><INPUT type="text" name="sample[]"/></TD>
		</TR>
		</tbody>
	</TABLE>
<br><br>
	Comments:<br>
        <textarea cols="35" rows="6" name="comments">
        </textarea><br><br>
	<input type="submit" name="submit" value="Submit"></button>
</BODY>
</HTML>

