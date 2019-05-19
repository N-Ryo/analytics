$(document).on 'turbolinks:load', ->
  $('#url-raw').blur ->
    console.log(url_raw = $('#url-raw').val())
    if url_raw
      console.log(url_host = url_raw.split('#')[0].split('?')[0].split('/')[2].split(':')[0])
      $('#url-host').val(url_host)
