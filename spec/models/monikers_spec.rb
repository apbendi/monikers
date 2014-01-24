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

  context "when testing list method" do  
    context "when given Ben" do
      let(:monikers_list) { Monikers.list("Ben") }
      let(:correct_results) { ["benjamin", "jamie", "benedict", "bennie", "benny", "ben"] }

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

    context "when given John vs. john" do
      let(:lowcase_list) { Monikers.list("john") }
      let(:upcase_list) { Monikers.list("John") }

      it "should return the same list" do
        lowcase_list.sort.should eq(upcase_list.sort)
      end
    end
  end

  context "when testing equivalents method" do
    it "should match Bob and Robert" do
      Monikers.equivalents?("Bob", "Robert").should eq(true)
    end 

    it "should not match Mike and Matt" do
      Monikers.equivalents?("Mike", "Matt").should eq(false)
    end

    it "should match Polycarp and Polycarp" do
      Monikers.equivalents?("Polycarp", "Polycarp").should eq(true)
    end

    it "should match joE and Joe" do
      Monikers.equivalents?("joE", "Joe").should eq(true)
    end

    it "should not match Jim and jOn" do
      Monikers.equivalents?("Jim", "jOn").should eq(false)
    end

    it "should match Ben and Benny" do
      Monikers.equivalents?("Ben", "Benny").should eq(true)
    end
  end

end