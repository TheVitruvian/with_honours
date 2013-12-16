$ ->
  $(".vote-link").click (e) ->
    $el = $(this)
    h = $el.attr('href')
    $.ajax url: h, type: "PUT"
    
    
    $qScore = $el.parents('.questions-score')
    $score = $qScore.find('.score')
    voteDir = if $el.hasClass('vote-up') then 1 else -1
    
    curScore = parseInt $score.text()
    newScore = curScore + window.userVote * voteDir

    $score.text(newScore)

    false

     
#   ajax_vote = ->
#     url = $(this).attr("#vote")
#     $.ajax ({
#       type: "PUT",
#       url: url,
#       })


#     $('.atleta').click(function(e) {
#       e.preventDefault();
#       $('.atleta').removeClass('atleta_atual');
#       $(this).addClass('atleta_atual');
#       var h = $("a",this).attr('href');
#       alert(h);
# });