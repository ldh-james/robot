require 'coordinate'

describe Coordinate do

  let(:table_top) { TableTop.new(5, 5)}
  let(:coordinate) { Coordinate.new(table_top) }

  describe ".update" do
    context "update valid coordinate" do
      before { coordinate.update(3, 4) }
      it { expect(coordinate.x).to eql(3) }
      it { expect(coordinate.y).to eql(4) }
    end
    context "update invalid coordinate" do
      before { coordinate.update(5, 6) }
      it { expect(coordinate.x).to eql(nil) }
      it { expect(coordinate.y).to eql(nil) }
    end
  end

  describe ".move" do

    context "move with invalid coordinate" do
      before { coordinate.update(5, 6) }
      it { expect(coordinate.move("SOUTH")).to eql(:ignore) }
    end

    context "move with valid coordinate" do
      before { coordinate.update(3, 4) }
      it { expect(coordinate.move("NORTH")).to eql(:success) }
    end

    before(:each) { coordinate.update(3, 4) }

    context "move to north" do
      before { coordinate.move("NORTH") }
      it { expect(coordinate.x).to eql(3) }
      it { expect(coordinate.y).to eql(5) }
    end

    context "move to east" do
      before { coordinate.move("EAST") }
      it { expect(coordinate.x).to eql(4) }
      it { expect(coordinate.y).to eql(4) }
    end

    context "move to south" do
      before { coordinate.move("SOUTH") }
      it { expect(coordinate.x).to eql(3) }
      it { expect(coordinate.y).to eql(3) }
    end

    context "move to west" do
      before { coordinate.move("WEST") }
      it { expect(coordinate.x).to eql(2) }
      it { expect(coordinate.y).to eql(4) }
    end
  end

  describe ".valid" do
    context "x and y coordinate are valid" do
      before { coordinate.update(3, 4) }
      it { expect(coordinate.valid).to eql(true)}
    end

    context "x and y coordinate are not valid" do
      before { coordinate.update(5, 6) }
      it { expect(coordinate.valid).to eql(false) }
    end
  end
end