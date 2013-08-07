require './lib/robots'
require './lib/parser'

robot = Robot.new
parser = Parser.new(ARGV[0])
parser.parse_actions

parser.parsed_actions.each do |action|
  if action[:action] == "PLACE"
    robot.send(action[:action].downcase, action[:x], action[:y], action[:position])
  else
    robot.send(action[:action].downcase)
  end
end