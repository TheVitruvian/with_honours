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

  $(".answer-vote-link").click (e) ->
    $el = $(this)
    h = $el.attr('href')
    $.ajax url: h, type: "PUT"
    
    $qScore = $el.parents('.answers-score')
    $score = $qScore.find('.answer-score')
    voteDir = if $el.hasClass('answer-vote-up') then 1 else -1
    curScore = parseInt $score.text()
    

    if $el.hasClass('answer-voted-on') && $el.hasClass('answer-vote-up')
      #correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('answer-voted-on')
    else if $el.hasClass('answer-voted-on') && $el.hasClass('answer-vote-down')
      # correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('answer-voted-on')
    else if !$el.hasClass('answer-voted-on') && $el.hasClass('answer-vote-up')
      $opposite_vote = $qScore.find('.answer-vote-down')

      if $opposite_vote.hasClass('answer-voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('answer-voted-on')
        $opposite_vote.removeClass('answer-voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('answer-voted-on')

    else if !$el.hasClass('answer-voted-on') && $el.hasClass('answer-vote-down')
      $opposite_vote = $qScore.find('.answer-vote-up')

      if $opposite_vote.hasClass('answer-voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('answer-voted-on')
        $opposite_vote.removeClass('answer-voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('answer-voted-on')  

    $score.text(newScore)

    false

  $(".comment-vote-link").click (e) ->
    $el = $(this)
    h = $el.attr('href')
    $.ajax url: h, type: "PUT"
    
    $qScore = $el.parents('.comments-score')
    $score = $qScore.find('.comment-score')
    voteDir = if $el.hasClass('comment-vote-up') then 1 else -1
    curScore = parseInt $score.text()
    

    if $el.hasClass('comment-voted-on') && $el.hasClass('comment-vote-up')
      #correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('comment-voted-on')
    else if $el.hasClass('comment-voted-on') && $el.hasClass('comment-vote-down')
      # correct
      newScore = curScore - window.userVote * voteDir
      $el.removeClass('comment-voted-on')
    else if !$el.hasClass('comment-voted-on') && $el.hasClass('comment-vote-up')
      $opposite_vote = $qScore.find('.comment-vote-down')

      if $opposite_vote.hasClass('comment-voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('comment-voted-on')
        $opposite_vote.removeClass('comment-voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('comment-voted-on')

    else if !$el.hasClass('comment-voted-on') && $el.hasClass('comment-vote-down')
      $opposite_vote = $qScore.find('.comment-vote-up')

      if $opposite_vote.hasClass('comment-voted-on')
        newScore = curScore + window.userVote * voteDir * 2
        $el.addClass('comment-voted-on')
        $opposite_vote.removeClass('comment-voted-on')
      else
        newScore = curScore + window.userVote * voteDir
        $el.addClass('comment-voted-on')  

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