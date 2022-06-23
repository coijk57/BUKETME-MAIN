/**
 * 
 */

 $(document).ready(function(){
	
	$('ul.ContentDetail_List li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.ContentDetail_List li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})