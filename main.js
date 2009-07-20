function check_hash()
{
	if (location.hash.replace('#', '') != $('.menu li.active').attr('id').replace('menu_', ''))
	{
		$('#menu_' + location.hash.replace('#', '')).click();
	}
	setTimeout(check_hash, 500);
}

function onload_event()
{
	$('.menu li').click(function(){
		$('.menu li').removeClass('active');
		$(this).addClass('active');
		location.hash = $(this).attr('id').replace('menu_', '');
		$.get($(this).attr('id').replace('menu_', '') + '.html', {}, function(data, stat) {
			$('#content').html(data);
			$('#content').removeClass('home').html();
		});
	});
		
	if (location.hash)
	{
		$('#menu_' + location.hash.replace('#', '')).click();
	}
	
	setTimeout(check_hash, 500);
}