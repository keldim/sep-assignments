include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("Mad Max 2: The Road Warrior", 98) }
  let (:tree) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, pacific_rim)
      expect(root.left.title).to eq "Pacific Rim"
    end


    it "properly inserts a new node as a right child" do
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      expect(root.right.title).to eq "Braveheart"
    end

    it "1. a new node becomes a parent if it is greater than the existing node" do
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      tree.insert(root, jedi)
      expect(root.left.title).to eq "Star Wars: Return of the Jedi"
      expect(root.left.left.title).to eq "Pacific Rim"
    end

    it "2. a new node becomes a parent if it is greater than the existing node" do
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      tree.insert(root, jedi)
      tree.insert(root, donnie)
      tree.insert(root, inception)
      expect(root.right.title).to eq "Inception"
      expect(root.right.left.title).to eq "Braveheart"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, jedi)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, pacific_rim)
      expect(tree.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a right node" do
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      expect(tree.find(root, braveheart.title).title).to eq "Braveheart"
    end

    it "properly finds a left-right node" do
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      expect(tree.find(root, braveheart.title).title).to eq "Braveheart"
    end



    it "properly finds a right-left node" do
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      tree.insert(root, jedi)
      expect(tree.find(root, jedi.title).title).to eq "Star Wars: Return of the Jedi"
    end


  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      tree.delete(root, pacific_rim.title)
      expect(tree.find(root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      tree.delete(root, braveheart.title)
      expect(tree.find(root, braveheart.title)).to be_nil
    end

    it "properly finds a right-left node" do
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, pacific_rim)
      tree.insert(root, braveheart)
      tree.insert(root, jedi)
      tree.delete(root, jedi.title)
      expect(tree.find(root, jedi.title)).to be_nil
    end


  end

  describe "#printf" do
    specify {
      expected_output = "Mad Max 2: The Road Warrior: 98\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\nThe Martian: 92\nThe Shawshank Redemption: 91\nDistrict 9: 90\nThe Matrix: 87\nInception: 86\nDonnie Darko: 85\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nPacific Rim: 72\n"
      tree.insert(root, empire)
      tree.insert(root, hope)
      tree.insert(root, martian)
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, matrix)
      tree.insert(root, inception)
      tree.insert(root, donnie)
      tree.insert(root, jedi)
      tree.insert(root, braveheart)
      tree.insert(root, pacific_rim)
      expect { tree.printf }.to output(expected_output).to_stdout
    }
  end
end
