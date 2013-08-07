require './lib/robots'

describe 'robots' do

  let(:robot) { Robot.new }

  describe ".supported_directions" do
    it "returns an array of supported directions" do
      Robot.supported_directions.should include('NORTH', 'EAST', 'SOUTH', 'WEST')
    end
  end

  describe '#place' do
    context "on the table" do

      before { robot.place(1,1,'NORTH') }

      it 'should place the robot at 2,3,SOUTH' do
        robot.place(2,3,'SOUTH')
        robot.x.should eq 2
        robot.y.should eq 3
        robot.direction.should eq 'SOUTH'
      end

      context 'supported directions' do
        it 'support NORTH' do
          robot.place(0,0,'NORTH')
          robot.direction.should eq 'NORTH'
        end

        it 'supports EAST' do
          robot.place(0,0,'EAST')
          robot.direction.should eq 'EAST'
        end

        it 'supports SOUTH' do
          robot.place(0,0,'SOUTH')
          robot.direction.should eq 'SOUTH'
        end

        it 'supports WEST' do
          robot.place(0,0,'WEST')
          robot.direction.should eq 'WEST'
        end

        it 'handles unsupported directions by using the currently set direction' do
          robot.place(3,4, 'Hello Ruby')
          robot.direction.should eq 'NORTH'
        end
      end

      it 'upcases the direction if a downcased version is supplied' do
        robot.place(0,0,'north')
        robot.direction.should eq 'NORTH'
      end

      context 'out of bounds' do
        it 'should remain in the same position' do
          robot.place(5,5, 'NORTH')
          robot.x.should eq 1
          robot.y.should eq 1
          robot.direction.should eq 'NORTH'
        end
      end
    end
  end

  describe '#move' do
    it 'should move the robot NORTH one step' do
      robot.place(0,0,'NORTH')
      robot.move
      robot.x.should eq 0
      robot.y.should eq 1
      robot.direction.should eq 'NORTH'
    end

    it 'should move the robot EAST one step' do
      robot.place(0,0,'EAST')
      robot.move
      robot.x.should eq 1
      robot.y.should eq 0
      robot.direction.should eq 'EAST'
    end

    it 'should move the robot WEST one step' do
      robot.place(1,1,'WEST')
      robot.move
      robot.x.should eq 0
      robot.y.should eq 1
      robot.direction.should eq 'WEST'
    end

    it 'should move the robot SOUTH one step' do
      robot.place(3,2,'SOUTH')
      robot.move
      robot.x.should eq 3
      robot.y.should eq 1
      robot.direction.should eq 'SOUTH'
    end

    context "moving out of bounds" do

      it "remains at 4,4,NORTH" do
        robot.place(4,4,'NORTH')
        robot.move
        robot.x.should eq 4
        robot.y.should eq 4
        robot.direction.should eq 'NORTH'
      end

      it "remains at 4,3,EAST" do
        robot.place(4,3,'EAST')
        robot.move
        robot.x.should eq 4
        robot.y.should eq 3
        robot.direction.should eq 'EAST'
      end

      it "remains at 0,0,SOUTH" do
        robot.place(0,0,'SOUTH')
        robot.move
        robot.x.should eq 0
        robot.y.should eq 0
        robot.direction.should eq 'SOUTH'
      end

      it "remains at 0,0,WEST" do
        robot.place(0,0,'WEST')
        robot.move
        robot.x.should eq 0
        robot.y.should eq 0
        robot.direction.should eq 'WEST'
      end
    end

    context "off the table" do
      it "ignores the move operation" do
        robot.move
        robot.x.should be_nil
        robot.y.should be_nil
        robot.direction.should be_nil
      end
    end
  end

  describe "#left" do
    it "should set the position to WEST" do
      robot.place(0,0,'NORTH')
      robot.left
      robot.direction.should eq "WEST"
    end

    it "should set the position to SOUTH" do
      robot.place(0,0,'WEST')
      robot.left
      robot.direction.should eq "SOUTH"
    end

    it "should set the position to EAST" do
      robot.place(0,0,'SOUTH')
      robot.left
      robot.direction.should eq "EAST"
    end

    it "should set the position to NORTH" do
      robot.place(0,0,'EAST')
      robot.left
      robot.direction.should eq "NORTH"
    end

    context "off the table" do
      it "ignores the operation" do
        robot.left
        robot.direction.should be_nil
      end
    end
  end

  describe "#right" do
    it "should set the position to EAST" do
      robot.place(0,0,'NORTH')
      robot.right
      robot.direction.should eq "EAST"
    end

    it "should set the position to SOUTH" do
      robot.place(0,0,'EAST')
      robot.right
      robot.direction.should eq "SOUTH"
    end

    it "should set the position to WEST" do
      robot.place(0,0,'SOUTH')
      robot.right
      robot.direction.should eq "WEST"
    end

    it "should set the position to NORTH" do
      robot.place(0,0,'WEST')
      robot.right
      robot.direction.should eq "NORTH"
    end

    context "off the table" do
      it "ignores the operation" do
        robot.right
        robot.direction.should be_nil
      end
    end
  end

  describe "#report" do
    it "should puts x,y,position" do
      robot.place(0,0,'NORTH')
      robot.should_receive(:puts).with("0,0,NORTH")
      robot.report
    end

    context "off the table" do
      it "ignores the operation" do
        robot.should_not_receive(:puts).with(anything)
        robot.report
      end
    end
  end

  describe "#placed?" do
    context "on the table" do
      it "returns true" do
        robot.place(0,0,'NORTH')
        robot.placed?.should be_true
      end
    end

    context "off the table" do
      it "returns false" do
        robot.placed?.should be_false
      end
    end
  end
end