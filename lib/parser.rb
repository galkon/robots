require './lib/robot'

class Parser

  attr_reader :file_path, :parsed_actions

  def initialize(file_path)
    @file_path = file_path
    @parsed_actions = []
  end

  def parse_actions
    File.open(file_path, 'r').each_line do |line|
      match = line.match(/(\w+)(.*)/)
      
      if match and action = match[1]
        if action == "PLACE"
          args = match[2].strip.split(',')
          @parsed_actions << { action: action, x: args[0].to_i, y: args[1].to_i, position: args[2] }
        else
          @parsed_actions << { action: action }
        end
      else
        next
      end
    end
  end
end