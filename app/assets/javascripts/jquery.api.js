$(function(){
  $.ajax({
    method: 'post',
    url: 'http://localhost:3000/api/v1/pvs',
    dataType: "jsonp",
    contentType: "application/json",
    data: JSON.stringify({
        pv: { url: location.href, }
    }),
    timeout: 10000,
  })
})
