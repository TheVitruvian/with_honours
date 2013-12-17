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

  getValue = (id) -> $(id).val()

  checkTitleLength = ->
    title = getValue("#question_title")
    if title.length > 0
      $("#question_submit").prop('disabled', false)
    else
      $("#question_submit").prop('disabled', true)


  check_for_answer = ->
    answer = CKEDITOR.instances.answer.getData().length
    if answer > 49
      $("#answer-submit").prop('disabled', false)
    else
      $("#answer-submit").prop('disabled', true)


  checkCommentLength = ->
    $el = $(this)
    $container = $el.parent().parent()
    $commentButton = $container.find('.comment_submit')
    if $el.val().length < 9
      $commentButton.prop('disabled', true)
    else
      $commentButton.prop('disabled', false)


  setup_editor = ->
    check_for_answer()
    checkCommentLength()
    
    CKEDITOR.instances.answer.on 'key', check_for_answer

  CKEDITOR.on 'instanceReady', setup_editor
  $("#question_title").on 'keyup', checkTitleLength
  $(".comment_content").keyup checkCommentLength

  $(".nav-bar").addClass('animated bounceOutLeft')


  window.onload = checkTitleLength()
  window.onload = checkCommentLength








