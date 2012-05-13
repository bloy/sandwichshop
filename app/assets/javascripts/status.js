function statusCheck() {
  $('tr.sandwich-row.open').each(
    function() {
      id = $(this).attr('data-sandwich_id');
      url = '/sandwiches/' + id;
      $.get(
        url,
        function(data) {
          if (data['status'] == 'CLOSED') {
            $('#sandwich_' + data['id']).fadeOut('slow',
                                                 function() {
                                                   $(this).remove();
                                                 });
            $('#sandwichlist-closed').prepend(data['html']);
          }
        },
        'json');
    });
}

$(function() {
  window.setInterval(statusCheck, 5000);
});
