begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
  puts 'awesome_print is not installed.'
end

Pry.config.editor = 'vim'

Pry.config.prompt_name = File.basename(Dir.pwd)
Pry.config.prompt = Pry::NAV_PROMPT

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'

  Pry::Commands.command /^$/, "repeat last command" do
    _pry_.run_command Pry.history.to_a.last
  end
end
