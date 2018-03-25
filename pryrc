Pry.config.editor = 'vim'
Pry.config.prompt_name = File.basename(Dir.pwd)
Pry.config.default_window_size = 10

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

Pry.config.ls.separator = "\n"
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

Pry.prompt = [
  proc { |object, nested_level, pry|
    prompt  = "\001\e[1;30m\002[%3d]\001\e[0m\002 " % pry.input_array.size
    prompt += "\001\e[0;32m\002#{Pry.config.prompt_name}\001\e[0m\002"
    prompt += "(\001\e[0;31m\002#{Pry.view_clip(object)}\001\e[0m\002)".gsub('::', "\001\e[0m\002::\001\e[0;31m\002")
    prompt += "#{":#{nested_level}" unless nested_level.zero?}> "
  },
  proc { |object, nested_level, pry|
    prompt  = "\001\e[1;30m\002[%3d]\001\e[0m\002 " % pry.input_array.size
    prompt += "\001\e[0;32m\002#{Pry.config.prompt_name}\001\e[0m\002"
    prompt += "(\001\e[0;31m\002#{Pry.view_clip(object)}\001\e[0m\002)".gsub('::', "\001\e[0m\002::\001\e[0;31m\002")
    prompt += "#{":#{nested_level}" unless nested_level.zero?}* "
  }
]

begin
  require 'awesome_print'
  Pry.config.print = proc do |output, value|
    value = value.to_a if defined?(ActiveRecord) && value.is_a?(ActiveRecord::Relation)
    output.puts value.ai
  end
rescue LoadError => err
  Pry.config.print = Pry::DEFAULT_PRINT
end
