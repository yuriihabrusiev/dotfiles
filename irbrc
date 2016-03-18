require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 1000

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  puts 'awesome_print is not installed.'
end

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
