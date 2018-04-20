$(document).ready(function() {

  $('#mp4_form').on('submit', function(e) {
    e.preventDefault();

    var form_data = $(this).serialize();

    $.ajax({
      type: 'POST',
      url: '/convert_mp4',
      data: form_data,
      success: function(data, textStatus, jQxhr) {
        $('#mp4_download_link').attr('href', 'download_mp4/' +data)
        $('#mp4_download_wrappper').show();
      },
      error: function(jqXhr, textStatus, errorThrown) {
        console.log(errorThrown);
      }
    });
  });

  $('#mp3_form').on('submit', function(e) {
    e.preventDefault();

    var form_data = $(this).serialize();

    $.ajax({
      type: 'POST',
      url: '/convert_mp3',
      data: form_data,
      success: function(data, textStatus, jQxhr) {
        $('#mp3_download_link').attr('href', 'download_mp3/' +data)
        $('#mp3_download_wrappper').show();
      },
      error: function(jqXhr, textStatus, errorThrown) {
        console.log(errorThrown);
      }
    });
  });

});
