$(document).ready ->
	$('#custom_phase2 form').submit (event) ->
		event.preventDefault()

		url = $(this).attr('action')
		micropost_content = $('#custom_phase2 #micropost_content').val()
		
		$.ajax
			type: 'post'
			url: url
			data: { micropost: { content: micropost_content } }
			dataType: 'json'
			success: (json) ->
				alert 'a'
				window.location.reload()