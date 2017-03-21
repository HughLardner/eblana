var codeGenerator = {
		
		
		objectInteger: function(div, childCount, description){
			var childCountPlus =childCount+1;
			var content = "<div class='formField'>";
			content += "<label for='"+div+"["+childCount+"]'>"+ description +" "+childCountPlus+": &nbsp;&nbsp;</label>";
			content += "<input class='form-control' name='"+div+"["+childCount+"]' id='"+div+"["+childCount+"]' value='' type='number' min='0' />";
			content += "</div>";
			return content;
		},
		

		objectString: function(div, childCount, description){
			var childCountPlus =childCount+1;
			var content = "<div class='formField'>";
			content += "<label for='"+div+"["+childCount+"]'>"+ description +" "+childCountPlus+": &nbsp;&nbsp;</label>";
			content += "<input class='form-control' name='"+div+"["+childCount+"]' id='"+div+"["+childCount+"]' value='' type='text' />";
			content += "</div>";
			return content;
		},
		
		
		/**
		 *  propertyInteger produces html code for html select element, it takes in the normal div, childCount and description parameters.
		 *  In particular, you need to specify the name of the property. (Unlike propertyCompany or propertyPerson, whose property is always default to
		 *  company and person, a integer property can be of any name)
		 * 
		 * */
		propertyInteger: function(div, childCount, property, description) {
			var content = "<div class='formField'>";
			var name_element = div+"["+childCount+"]."+property;
			content += "<label for='"+name_element+"]'>"+description+": &nbsp;&nbsp;</label>";
			content += "<input class='form-control' name='"+name_element+"' id='"+name_element+"' value='' type='number' min='0' />";
			content += "</div>";	
			return content
		},
		
		propertyString: function(div, childCount, property, description) {
			var content = "<div class='formField'>";
			var name_element = div+"["+childCount+"]."+property;
			content += "<label for='"+name_element+"]'>"+description+": &nbsp;&nbsp;</label>";
			content += "<input class='form-control' name='"+name_element+"' id='"+name_element+"' value='' type='text' />";
			content += "</div>";	
			return content;
		},
		
		
		/**
		 *  propertySelect produces html code for html select element, it takes in the normal div, childCount and description parameters.
		 *  Similar to integer/string property,  you need to specify the name of the property. (Unlike propertyCompany or propertyPerson, 
		 *  whose property is always default to company and person, a select property can be of any name)
		 *	
		 *  In addition, you should provide two lists: list of keys of each select option, list of values of each select option(to display to users).
		 *  The two list should hold the same sequence, as in, the nth element of the key list should be the id of the nth element of the value list.
		 *
		 * */
		propertySelect: function(div, childCount, property, list_key, list_value, description){
			var childCountPlus = childCount + 1;
			var id_element = div+"["+childCount+"]."+property+".id";
			var content = "<div class='formField'>";
			content += "<label for='"+id_element+"'>"+description+" "+childCountPlus+": &nbsp;&nbsp;</label>";
			content += "<select id='"+id_element+"' class='many-to-one' name='"+id_element+"'>";
			content+= "<option value='null'>";
			content+= "";
			content+= "</option>";
			for(var i=0;i<list_key.length;i++){
				content+= "<option value='"+list_key[i]+"'>";
				content+= list_value[i];
				content+= "</option>";
			}
			content += "</select>"
			content += "</div>";	
			return content;
		},
		


		
		autocompleteOptionCompany: function (prefix) {
			var autocomplete_option_company = {
					source: function(request, response){
						originaljQuery.ajax({
							url: prefix+"/company/getAllCompanies", // remote datasource
							data: request,
							success: function(data){
								response(data); // set the response
							},
							error: function(){ // handle server errors
							}
						});     
					},
					minLength: 2, // triggered only after minimum 2 characters have been entered.
					select: function(event, ui) { // event handler when user selects a company from the list.
						var element_name = originaljQuery(this).attr('name');
						var element = element_name.substring(0,element_name.length-10); // -10 offset here strips off the .legalName suffix from the name string
						$("input[id='"+element+".id']").val(ui.item.id); // update the hidden field.
					},
					response: function(event, ui){
						var element_name = originaljQuery(this).attr('name');
						var element = element_name.substring(0, element_name.length-10);
						if(ui.content.length == 0){
							 // there is no response from the remote data source.  1) Display indication message; 2) clean up the id of previously selected company names
							$("input[id='"+element+".id']").val(-1); // use -1 as an indicator of create
							$("p[id='"+element+"-empty-message']").text("new company");
						}else {
							$("p[id='"+element+"-empty-message']").empty();
						}
					}
				};
			return autocomplete_option_company;
		},
		
				
		
		header: function(div_id){
			return "<div id='"+div_id+"' name='"+div_id+"' class='newhidden formField_inside'>\n";
		},
		
		tailer: function(div, counter, delete_icon){
			return "<span onClick='removeElement(\""+div+"\", \""+counter+"\");'><img src='"+delete_icon+"'/></span></div>"
		},
		escapeDiv: function(div){
			    if (div)
			        return div.replace(/([ #;?%&,.+*~\':"!^$[\]()=>|\/@])/g,'\\$1');      
			    return div;
		}
}