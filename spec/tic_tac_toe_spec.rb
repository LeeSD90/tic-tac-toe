require 'board.rb'
require 'player.rb'

describe Board do
	subject do
		Board.new
	end

	let (:player) {Player.new("Bill", "X")}

	context "#win" do
        it "returns true 3 across top line" do
            subject.instance_variable_set("@squares", [["X","X","X"],[4,5,6],[7,8,9]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true 3 across middle line" do
            subject.instance_variable_set("@squares", [[1,2,3],["X","X","X"],[7,8,9]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true 3 across bottom line" do
            subject.instance_variable_set("@squares", [[1,2,3],[4,5,6],["X","X","X"]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true 3 along left side" do
            subject.instance_variable_set("@squares", [["X",2,3],["X",5,6],["X",8,9]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true 3 up down middle" do
            subject.instance_variable_set("@squares", [[1,"X",3],[4,"X",6],[7,"X",9]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true 3 along right side" do
            subject.instance_variable_set("@squares", [[1,2,"X"],[4,5,"X"],[7,8,"X"]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true for top left to bottom right diagonal" do
        	subject.instance_variable_set("@squares", [["X",2,3],[4,"X",6],[7,8,"X"]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns true for bottom left to top right diagonal" do
        	subject.instance_variable_set("@squares", [[1,2,"X"],[4,"X",6],["X",8,9]])
            expect(subject.send :check_win, player.side).to eq(true)
        end

        it "returns false when no win" do
            subject.instance_variable_set("@squares", [[1,2,3],[4,5,6],[7,8,9]])
            expect(subject.send :check_win, player.side).to eq(false)
        end
    end
end