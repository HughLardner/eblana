<g:javascript src="jquery.media.js" />
<g:javascript src="codeGenerator.js"/>

<script type="text/javascript">
var originaljQuery = {};
originaljQuery = jQuery.noConflict(true);
var deleteIcon = "${resource(dir:'images/skin',file:'database_delete.png')}";

var counterMap = {};

</script>
<g:each var="property" in="${properties}" status="i">
	<g:set var="propertyCounter${evaluate(property)}" value="${evaluate('instance?.'+property+'.size()')}"/>
	<script type="text/javascript">
	counterMap["${property}"] = parseInt("${evaluate('instance?.'+property+'.size()')}",10);
	</script>
</g:each>

<script type="text/javascript">

var addClass = function(div){
	var childCount = counterMap[div];
	var templateHtml = codeGenerator.header(div+childCount);
	var list_key = ${eblana.character.Classes.list().id};
	var raw_value = "${eblana.character.Classes.list()}";
	var list_value = raw_value.replace("[","").replace("]","").split(", ");
	templateHtml += codeGenerator.propertySelect(div, childCount, "classes", list_key, list_value, "");
	templateHtml += codeGenerator.tailer(div, childCount, deleteIcon);
	originaljQuery(templateHtml).appendTo('div#'+codeGenerator.escapeDiv(div));
	counterMap[div] = counterMap[div]+1;
};

var addFeat = function(div){
	var childCount = counterMap[div];
	var templateHtml = codeGenerator.header(div+childCount);
	var list_key = ${eblana.character.Feat.list().id};
	var raw_value = "${eblana.character.Feat.list()}";
	var list_value = raw_value.replace("[","").replace("]","").split(", ");
	templateHtml += codeGenerator.propertySelect(div, childCount, "feat", list_key, list_value, "Feat");
	var effect_key = ${eblana.character.Effect.list().id};
	var effect_value = "${eblana.character.Effect.list()}";
	var effect_value = effect_value.replace("[","").replace("]","").split(", ");
	templateHtml += codeGenerator.propertySelect(div, childCount, "effect", effect_key, effect_value, "Effect ");
	templateHtml += codeGenerator.propertyString(div,childCount, "source", "Source");
	templateHtml += codeGenerator.tailer(div, childCount, deleteIcon);
	originaljQuery(templateHtml).appendTo('div#'+codeGenerator.escapeDiv(div));
	counterMap[div] = counterMap[div]+1;
};

var addSpell = function(div){
	var childCount = counterMap[div];
	var templateHtml = codeGenerator.header(div+childCount);
	var list_key = ${eblana.character.Spell.list().id};
	var raw_value = "${eblana.character.Spell.list()}";
	var list_value = raw_value.replace("[","").replace("]","").split(", ");
	templateHtml += codeGenerator.propertySelect(div, childCount, "spell", list_key, list_value, "Spell");
	var effect_key = ${eblana.character.Effect.list().id};
	var effect_value = "${eblana.character.Effect.list()}";
	var effect_value = effect_value.replace("[","").replace("]","").split(", ");
	templateHtml += codeGenerator.propertySelect(div, childCount, "effect1", effect_key, effect_value, "Effect 1");
	templateHtml += codeGenerator.propertySelect(div, childCount, "effect2", effect_key, effect_value, "Effect 2");
	templateHtml += codeGenerator.propertyString(div,childCount, "source", "Source");
	templateHtml += codeGenerator.tailer(div, childCount, deleteIcon);
	originaljQuery(templateHtml).appendTo('div#'+codeGenerator.escapeDiv(div));
	counterMap[div] = counterMap[div]+1;
};

var addLore = function(div){
	var childCount = counterMap[div];
	var templateHtml = codeGenerator.header(div+childCount);
	var list_key = ${eblana.character.Lore.list().id};
	var raw_value = "${eblana.character.Lore.list()}";
	var list_value = raw_value.replace("[","").replace("]","").split(", ");
	templateHtml += codeGenerator.propertySelect(div, childCount, "lore", list_key, list_value, "");
	templateHtml += codeGenerator.tailer(div, childCount, deleteIcon);
	originaljQuery(templateHtml).appendTo('div#'+codeGenerator.escapeDiv(div));
	counterMap[div] = counterMap[div]+1;
};




var removeElement = function(div, counter){ // blah, 1
	var element = div+counter; //blah[1]
	var element_to_remove_object = originaljQuery("#"+codeGenerator.escapeDiv(element));
	var parent = element_to_remove_object.parent(); // should logically use parent().get(0). but it doesnt work. Assumption is that
													// if the parent() method is called on a single object, it does not return a 
													// single value set but a single object
	element_to_remove_object.remove();
	
	// then shifting all element behind blah[1] by one
	var sibling_counter = parseInt(counter, 10) + 1;
	var sibling_shift_index = parseInt(counter, 10);
	var sibling_selector = "#"+codeGenerator.escapeDiv(div+sibling_counter);
	var sibling = parent.children(sibling_selector);
	while(sibling.length!=0){
		// replace "["+sibling_counter+"]" with "["+sibling_shift_index+"]"
		// replace "div"+sibling_counter with "div"+sibling_shift_index
		// in html content of the sibling object
		sibling.find("[id^="+codeGenerator.escapeDiv(div+"["+sibling_counter+"]")+"]").each(function(){
				var id_value = originaljQuery(this).attr("id").replace(div+"["+sibling_counter+"]", div+"["+sibling_shift_index+"]");
				originaljQuery(this).attr("id", id_value);
		});
		sibling.find("[name^="+codeGenerator.escapeDiv(div+"["+sibling_counter+"]")+"]").each(function(){
			var id_value = originaljQuery(this).attr("name").replace(div+"["+sibling_counter+"]", div+"["+sibling_shift_index+"]");
			originaljQuery(this).attr("name", id_value);
		});
		sibling.attr("id", sibling.attr("id").replace(div+sibling_counter, div+sibling_shift_index));
		// If the value of label element contains sibling_counter, then replace it with sibling_shift_index
		var display_counter =sibling_counter + 1;
		sibling.find("label").each(function(){
			var label_content = originaljQuery(this).html();
			label_content = label_content.replace(display_counter, sibling_counter);
			originaljQuery(this).html(label_content);
			originaljQuery(this).attr("for", originaljQuery(this).attr("for").replace(div+"["+sibling_counter+"]", div+"["+sibling_shift_index+"]"));
		});

		sibling_counter++;
		sibling_shift_index++;
		sibling_selector = "#"+codeGenerator.escapeDiv(div+sibling_counter); 
		sibling = parent.children(sibling_selector);
	}
	
	counterMap[div] = counterMap[div] - 1; //counterMap[blah] --
};

var clearSelection = function(div) {
	originaljQuery("#"+div).prop('selectedIndex', -1);
}
//array for elements that, when clicked/checked, trigger appearance/disapperance of other elements
var element_array = ["amended"]; // amended, when checked, hide previous version select.
var element_events_checked = [amended_event_checked]; // arrays for methods, which set the appearance of elements
var element_events_unchecked = [amended_event_unchecked];  // .... disappearance.....

function amended_event_checked(){
	originaljQuery("#previousVersion").show();
};

function amended_event_unchecked(){
	originaljQuery("#previousVersion.id").prop("selectedIndex",-1);
	originaljQuery("#previousVersion").hide();
};


originaljQuery(function(){ // equivalent to document ready
	originaljQuery('a.media').media({width:600,height:849}); //A4: width  1.4142 = height 
	originaljQuery(document).on("keydown", "input.comauto", function(){ // use this if there is autocomplete for company name
		originaljQuery(this).autocomplete(atcmplt_company);
	});
	originaljQuery(document).on("keydown", "input.firmauto", function(){ // use this if there is autocomplete for firm name
		originaljQuery(this).autocomplete(atcmplt_firm);
	});

	originaljQuery(".radiocheckbox").on('click', function(){ // use this if there is any logic in element appearance/disapperance on the page
		var element_index=0;
		for(element_index=0;element_index<element_array.length;element_index++){
			if(originaljQuery("#"+element_array[element_index]).attr("checked")){
				element_events_checked[element_index]();
			}else{
				element_events_unchecked[element_index]();
			}
		}
	});

});



</script>

