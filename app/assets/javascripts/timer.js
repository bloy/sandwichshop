function updateTimers() {
  $('time.timer').each(
    function() {
      ordered_at = Math.floor(new Date($(this).attr('datetime')).valueOf()/1000);
      now = Math.floor(new Date().valueOf()/1000);
      difference = now - ordered_at;
      seconds = difference % 60;
      difference = Math.floor(difference / 60);
      minutes = difference % 60;
      difference = Math.floor(difference / 60);
      hours = difference % 60;
      difference = Math.floor(difference / 60);
      days = difference;
      text = "";
      if (days > 0) {
        text = text + days + "d ";
      }
      if (days > 0 || hours > 0) {
        text = text + hours + "h ";
      }
      if (days > 0 || hours > 0 || minutes > 0) {
        text = text + minutes + "m ";
      }
      text = text + seconds + "s ago";
      $(this).html(text);
    });
}

$(function() {
  window.setInterval(updateTimers, 1000);
});
