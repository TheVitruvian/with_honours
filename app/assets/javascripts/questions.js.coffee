$ ->
  $(".vote-link").click (e) ->
    $el = $(this)
    h = $el.attr('href')
    $.ajax url: h, type: "PUT"
    
    $qScore = $el.parents('.questions-score')
    $score = $qScore.find('.score')
    voteDir = if $el.hasClass('vote-up') then 1 else -1
    curScore = parseInt $score.text()
    

    if $el.hasClass('voted-on') && $el.hasClass('vote-up')
      #correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('voted-on')
    else if $el.hasClass('voted-on') && $el.hasClass('vote-down')
      # correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('voted-on')
    else if !$el.hasClass('voted-on') && $el.hasClass('vote-up')
      $opposite_vote = $qScore.find('.vote-down')

      if $opposite_vote.hasClass('voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('voted-on')
        $opposite_vote.removeClass('voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('voted-on')

    else if !$el.hasClass('voted-on') && $el.hasClass('vote-down')
      $opposite_vote = $qScore.find('.vote-up')

      if $opposite_vote.hasClass('voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('voted-on')
        $opposite_vote.removeClass('voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('voted-on')  

    $score.text(newScore)

    false
  $(".comment-vote-link").click (e) ->
    $el = $(this)
    h = $el.attr('href')
    $.ajax url: h, type: "PUT"
    
    $qScore = $el.parents('.questions-score')
    $score = $qScore.find('.score')
    voteDir = if $el.hasClass('vote-up') then 1 else -1
    curScore = parseInt $score.text()
    

    if $el.hasClass('voted-on') && $el.hasClass('vote-up')
      #correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('voted-on')
    else if $el.hasClass('voted-on') && $el.hasClass('vote-down')
      # correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('voted-on')
    else if !$el.hasClass('voted-on') && $el.hasClass('vote-up')
      $opposite_vote = $qScore.find('.vote-down')

      if $opposite_vote.hasClass('voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('voted-on')
        $opposite_vote.removeClass('voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('voted-on')

    else if !$el.hasClass('voted-on') && $el.hasClass('vote-down')
      $opposite_vote = $qScore.find('.vote-up')

      if $opposite_vote.hasClass('voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('voted-on')
        $opposite_vote.removeClass('voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('voted-on')  

    $score.text(newScore)

    false

    # if (@upvoters.include? current_user.id) && (params[:score] == "1") then
    #   @post.score -= 1 
    #   @upvoters.delete(current_user.id)
    # elsif (@upvoters.include? current_user.id) && (params[:score] == "-1") then
    #   @post.score -= 2
    #   @upvoters.delete(current_user.id)
    #   @downvoters.push(current_user.id)
    # elsif (@downvoters.include? current_user.id) && (params[:score] == "1") then
    #   @post.score += 2
    #   @downvoters.delete(current_user.id)
    #   @upvoters.push(current_user.id)
    # elsif (@downvoters.include? current_user.id) && (params[:score] == "-1") then
    #   @post.score += 1
    #   @downvoters.delete(current_user.id)
    # elsif !(@downvoters.include? current_user.id) && !(@upvoters.include? current_user.id) then
    #   case params[:score]
    #   when "-1"
    #     @post.score -= 1
    #     @downvoters << current_user.id
    #   when "1"
    #     @post.score += 1
    #     @upvoters << current_user.id
    #   end

     
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