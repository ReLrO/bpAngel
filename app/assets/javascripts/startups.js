$(document).ready(function(){
	scrollResize();
	$("select.status-input").change(function(){
	  if ($(this).val() != "")
	  {
	 	  var currentFrom = $(this).closest("form");
	      var ajaxType = "POST";
	      if ($(currentFrom).attr("id").indexOf("edit") != -1)
	      {
		    ajaxType = "PUT"
	      }
	      $.ajax({
	        url: escape($(currentFrom).attr('action')),
	        cache: false,
	        data: $(currentFrom).serialize(),
	        dataType: "script",
	        type: ajaxType
	      });
	  }
	});
	
	$("table tr td.more-info").click(function(){
		$.ajax({
	        url: escape("/startups/" + $(this).parent().find("#startup_company_id").val()),
	        cache: true,
	        dataType: "script",
	        type: "GET"
	    });
	});
	


});

$(window).resize(function(){
	scrollResize();
});
function scrollResize(){
	$(".companies-list").height($(window).height() - 60);
}