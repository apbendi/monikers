require 'spec_helper'

describe Monikers do

  it { should respond_to(:list).with(1).argument }
  it { should respond_to(:equivalents?).with(2).arguments }

  context "when calling Monikers twice" do
    let(:monikers_list_one) { Monikers.list("Ben") }
    let(:monikers_list_two) { Monikers.list("Ben") }

    it "should should not add dupes to the dataset" do
      monikers_list_one.size.should eq(monikers_list_two.size)
      monikers_list_one.sort.should eq(monikers_list_two.sort)
    end
  end

  context "when testing list" do  
    context "when given Ben" do
      let(:monikers_list) { Monikers.list("Ben") }
      let(:correct_results) { ["benjamin", "jamie", "benedict", "bennie", "ben"] }

      it "should return the correct monikers list" do
        monikers_list.sort.should eq(correct_results.sort)
      end
    end

    context "when given Polycarp" do
      let(:monikers_list) { Monikers.list("Polycarp") }
      let(:correct_results) { ["polycarp"] }

      it "should return the correct monikers list" do
        monikers_list.sort.should eq(correct_results.sort)
      end
    end
  end

  context "when testing equivalents" do
    it "should match Bob and Robert" do
      Monikers.equivalents?("Bob", "Robert").should eq(true)
    end 

    it "should not match Mike and Matt" do
      Monikers.equivalents?("Mike", "Matt").should eq(false)
    end
  end

end