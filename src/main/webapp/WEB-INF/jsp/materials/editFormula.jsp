<!DOCTYPE HTML>
<html lang="en">

<%@ include file = "./../header.jsp" %>
 
 <script src="js/biomaterial.dynamic.select.list.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
 
 
<body>

<div class="container">
	<div id="topbar"> <%@ include file = "./../top_bar.jsp" %></div>
	<div id="menubar"> <%@ include file = "./../menu_bar.jsp" %></div>
	<h2 class="text-info">Edit Bio Formula Name to Search</h2>
	
	
	<form:form  action="editFormula"  method="post"  modelAttribute ="editBioFormulaForm" >
	
		<div class="form-group row">
			<div class="col-sm-9">
				<form:input class="form-control" id="selectedFormulaId" path="selectedFormulaId"  placeholder="Please enter formula name to edit"/>
				<form:errors  class="text-danger"  path="selectedFormulaId" />
			</div>
			<div class="col-sm-1">
				<button id="search-material" name="search-material" class="btn btn-info">List Associated Materials</button>
			</div>
		</div>
		
		<h4 class="text-info">Associated Materials: </h4>
			<table class="table table-hover table-striped">
			    <thead>
			      <tr>
			      	<th>Material Id</th>
			        <th>Material  Name</th>
			        <th>Short Desc</th>
			      </tr>
			    </thead>
			    <tbody>
					<c:forEach var="bioMaterial" items="${editBioFormulaForm.bioMaterials}">
						<tr>
        					<td>${bioMaterial.id}</td>
        					<td>${bioMaterial.commonName}</td>
        					<td>${bioMaterial.shortDesc}</td>
        					<td>
        					<button class="btn btn-info" onClick=deleteAssociation(${bioMaterial.id})>Delete</button>
        					</td>
        				</tr>	
							
					</c:forEach>
				</tbody>
					
			</table>	

		
	</form:form>
	
	
	
	
	<div id="footerbar"> <p>&nbsp;</p> <%@ include file = "./../footer_bar.jsp" %></div>	
</div>  
 
	<script>
	$('#selectedFormulaId').inputpicker({
	    url: 'getFormula',
	    fields:['id','name'],
	    fieldText : 'name',
	    fieldValue : 'id',
	    headShow: true,
	    filterOpen: true,
	    autoOpen: true
	});
	
	function deleteAssociation(bioMaterialId){
		var formulaId = document.getElementById('selectedFormulaId').value;
		var source = event.target || event.srcElement;
		source.disabled = true;
		
		const url = "deleteBioMaterialFormula?formulaId="+formulaId+"&materialId="+bioMaterialId;
		fetch(url, {
		    method : "GET"
		}).then(
		    response => response.text() 
		).then(
		    html => console.log(html)
		);
	}
	
	</script>
</body>