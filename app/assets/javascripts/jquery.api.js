$(function(){
  $.ajax({
    method: 'post',
    url: 'https://pv-analytics.herokuapp.com/api/v1/pvs',
    dataType: "json",
    contentType: "application/json",
    data: JSON.stringify({
        pv: { url: location.href, }
    }),
    timeout: 10000,
  })
})
