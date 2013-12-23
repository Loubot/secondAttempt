$(document).ready ->
	$('#custom_phase2 form').submit (event) ->
		event.preventDefault()

		url = $(this).attr('action')
		micropost_content = $('#custom_phase2 #micropost_content').val()
		
		$.ajax
			type: 'put'
			url: url
			data: { micropost: micropost_content } 
			dataType: 'json'
			success: (json) ->
				alert 'b'
				$('#custom_phase2').fadeOut()