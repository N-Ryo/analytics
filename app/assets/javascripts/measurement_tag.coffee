$(document).on 'turbolinks:load', ->
  $('#measurement-btn').click ->
    $('.notice').html "計測タグを発行しました。"
    $('#measurement-text').val('<script src="//code.jquery.com/jquery-3.1.1.js"></script><script src="https://pv-analytics.herokuapp.com/assets/application-b2da875ccb686cbd050669da5c5d5181fafc0280ff960b458a72f5225b640bb0.js"></script>')
    $('#measurement-notice').html '※計測するサイトで、jqueryがすでに動作可能な場合は、【<script src="//code.jquery.com/jquery-3.1.1.js"></script>】は削除しても問題ありません。'
