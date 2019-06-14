require 'spec_helper'

describe Monikers do
  it { is_expected.to respond_to(:list).with(1).argument }
  it { is_expected.to respond_to(:equivalents?).with(2).arguments }

  context 'when calling Monikers twice' do
    let(:monikers_list_one) { described_class.list('Ben') }
    let(:monikers_list_two) { described_class.list('Ben') }

    it 'shoulds not add dupes to the dataset' do
      expect(monikers_list_one.size).to eq(monikers_list_two.size)
      expect(monikers_list_one.sort).to eq(monikers_list_two.sort)
    end
  end

  context 'when testing list method' do
    context 'when given Ben' do
      let(:monikers_list) { described_class.list('Ben') }
      let(:correct_results) { %w[benjamin jamie benedict bennie benny ben] }

      it 'returns the correct monikers list' do
        expect(monikers_list.sort).to eq(correct_results.sort)
      end
    end

    context 'when given Polycarp' do
      let(:monikers_list) { described_class.list('Polycarp') }
      let(:correct_results) { ['polycarp'] }

      it 'returns the correct monikers list' do
        expect(monikers_list.sort).to eq(correct_results.sort)
      end
    end

    context 'when given John vs. john' do
      let(:lowcase_list) { described_class.list('john') }
      let(:upcase_list) { described_class.list('John') }

      it 'returns the same list' do
        expect(lowcase_list.sort).to eq(upcase_list.sort)
      end
    end
  end

  context 'when testing equivalents method' do
    it 'matches Bob and Robert' do
      expect(described_class.equivalents?('Bob', 'Robert')).to eq(true)
    end

    it 'does not match Mike and Matt' do
      expect(described_class.equivalents?('Mike', 'Matt')).to eq(false)
    end

    it 'matches Polycarp and Polycarp' do
      expect(described_class.equivalents?('Polycarp', 'Polycarp')).to eq(true)
    end

    it 'matches joE and Joe' do
      expect(described_class.equivalents?('joE', 'Joe')).to eq(true)
    end

    it 'does not match Jim and jOn' do
      expect(described_class.equivalents?('Jim', 'jOn')).to eq(false)
    end

    it 'matches Ben and Benny' do
      expect(described_class.equivalents?('Ben', 'Benny')).to eq(true)
    end

    it 'matches Brad and Bradley' do
      expect(described_class.equivalents?('Brad', 'Bradley')).to eq(true)
    end
  end
end
