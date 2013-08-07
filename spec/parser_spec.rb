require './lib/parser'

describe Parser do

  let(:parser) { Parser.new("robot_files/robots1.txt") }

  describe "initialize" do
    it "should set the file_path" do
      parser.file_path.should eq "robot_files/robots1.txt"
    end

    it "should initialize parser_actions to be an empty array" do
      parser.parsed_actions.should be_empty
    end
  end

  describe "parse_actions" do
    it "parses the given file into an array of actions" do
      parser.parse_actions
      parser.parsed_actions.should eq [{action: "PLACE", x: 0, y: 0, position: "NORTH"}, {action: "MOVE"}, {action: "REPORT"}]
    end

    it "handles empty lines" do
      parser = Parser.new("robot_files/patchy_robots_file.txt")
      parser.parse_actions
      parser.parsed_actions.should eq [{action: "PLACE", x: 0, y: 0, position: "NORTH"}, {action: "MOVE"}, {action: "MOVE"}]
    end

    it "handles all of the DSL language" do
      parser = Parser.new("robot_files/all_actions_robots.txt")
      parser.parse_actions
      parser.parsed_actions.should eq [{action: "PLACE", x: 1, y: 2, position: "EAST"}, {action: "MOVE"}, 
                                       {action: "MOVE"}, {action: "LEFT"}, {action: "RIGHT"}, {action: "MOVE"}, 
                                       {action: "REPORT"} ]
    end
  end
end