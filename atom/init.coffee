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
