function youtube_parser(url){
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = url.match(regExp);
    return (match&&match[7].length==11)? match[7] : false;
}

$('#soundtrack_submit').on('click', function(event){
  event.preventDefault();
  $('#soundtrack_container').html(
    "<iframe id='sound_vid' type='text/html' width='640' height='390' src='https://www.youtube.com/embed/" + youtube_parser($('#soundtrack_url').val()) + "?controls=1&showinfo=0&rel=0&autoplay=0&enablejsapi=1&start=0' frameborder='0' allowfullscreen></iframe>"
  );
  $('#number_of_clips_container').show();
});

$('#clips_submit').on('click', function(event){
  event.preventDefault();
  $('#clip_fields_container').append(
    "<input type='text' placeholder='Clip 1 Youtube URL' name='clip1_url'><input type='text' placeholder='Start Time in Seconds' name=clip1_start'><input type='text' placeholder='Duration in Seconds' name='clip1_duration'><br>"
  );
});