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
  $('#soundtrack_container').append(
    "<br><input id='soundtrack_start' type='text' placeholder='Soundtrack Start Time' name='soundtrack_start'>"
  );
  $('#number_of_clips_container').show();
});

var clipCount = 1;

$('#clips_submit').on('click', function(event){
  event.preventDefault();
  $('#clip_fields_container').append(
    "<input class='clip_row' type='text' placeholder='Clip " + clipCount + " Youtube URL' id='clip" + clipCount + "_url' name='clip" + clipCount + "_url'><input type='text' placeholder='Start Time in Seconds' id='clip" + clipCount + "_start' name=clip" + clipCount + "_start'><input type='text' placeholder='Duration in Seconds' id='clip" + clipCount + "_duration' name='clip" + clipCount + "_duration'><br>"
  );
  clipCount += 1;
});

$('#mix_submit').on('click', function(event){
  event.preventDefault();
  var numClips = $('.clip_row').length
  var clipInfo = {};
  for( i = 1; i <= numClips; i++){
    clipInfo[i] = [youtube_parser($('#clip'+i+'_url').val()), $('#clip'+i+'_start').val(), $('#clip'+i+'_duration').val()];
  };
  $.ajax({
    url: '/mixes',
    method: 'post',
    data: {
      'mix_name': $('#mix_name').val(),
      'soundtrack_url': youtube_parser($('#soundtrack_url').val()),
      'soundtrack_start': $('#soundtrack_start').val(),
      'clips': clipInfo
    }
  });
});