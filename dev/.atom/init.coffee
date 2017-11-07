# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

toCamelCase = (text) ->
  text
    .replace(/\_(\w)/g, ($1) -> $1.toUpperCase())
    .replace(/\_/g, '')
    .replace(/^(\w)/, ($1) -> $1.toUpperCase())

atom.commands.add 'atom-text-editor', 'utils:to-class-name', ->
  return unless editor = atom.workspace.getActiveTextEditor()
  editor.replaceSelectedText selectWordIfEmpty: true, (text) ->
    toCamelCase(text)

atom.commands.add 'atom-workspace', 'one-themes:toggle', ->
  lightTheme   = ["one-light-ui", "one-light-syntax"]
  darkTheme    = ["one-dark-ui", "one-dark-syntax"]
  currentTheme = atom.themes.getEnabledThemeNames().reverse()
  if currentTheme[0] == darkTheme[0]
    atom.config.set('core.themes', lightTheme)
  else
    atom.config.set('core.themes', darkTheme)
