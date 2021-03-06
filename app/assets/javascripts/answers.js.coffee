$ ->
  check_for_answer = ->
    answer = CKEDITOR.instances.answer.getData().length if CKEDITOR.instances.answer
    if answer > 49
      $("#answer-submit").prop('disabled', false)
    else
      $("#answer-submit").prop('disabled', true)

  setup_editor_answer = ->
    check_for_answer()
    CKEDITOR.instances.answer.on 'key', check_for_answer if CKEDITOR.instances.answer

   CKEDITOR.on 'instanceReady', setup_editor_answer