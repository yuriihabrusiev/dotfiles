begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
  puts 'awesome_print is not installed.'
end

Pry.config.editor = 'vim'

Pry.config.prompt_name = File.basename(Dir.pwd)
Pry.config.prompt = Pry::NAV_PROMPT

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
