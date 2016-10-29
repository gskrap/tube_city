$(document).ready(function(){
    $('#sound_vid').toggle()
    var playerCount = $('.clip_info').data('clips').length
    for (var i = 1; i < playerCount; i++) {
        $('#clip' + (i+1)).toggle();
    };
})

var players = []

var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function onYouTubeIframeAPIReady() {
    players[0] = new YT.Player('clip1', {
        events: {
            'onReady': onPlayerReady
        }
    });
}

function onPlayerReady() {
    var playerCount = $('.clip_info').data('clips').length
    var durations = [0]
    for (var i = 1; i < playerCount; i++) {
        players[i] = new YT.Player('clip' + (i+1));
        durations.push(($('.clip_info').data('clips')[i-1].duration) * 1000)
    };
    function playerSwitch(currentYT, currentEl, playerNum) {
        setTimeout(function () {
            if (playerNum < players.length) {
                nextYT = players[(players.indexOf(currentYT) + 1)]
                currentYT.stopVideo();
                currentEl.toggle();
                currentEl.next().toggle();
                nextYT.playVideo();
                nextYT.mute();
                playerSwitch(nextYT, currentEl.next(), (playerNum + 1))
            }
        }, durations[playerNum]);
    }

    players[0].playVideo();
    players[0].mute();
    playerSwitch(players[0], $('#clip1'), 1)
}

