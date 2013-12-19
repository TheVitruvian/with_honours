

CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  
  config.extraPlugins = 'confighelper'
  config.toolbar_Normal = [
    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    ['NumberedList','BulletedList','-','Outdent','Indent'],
    ['Link','Unlink'],
    ['Font','FontSize'],
    ['TextColor']
  ]
  
  config.toolbar = 'Normal'

  true

