require 'spec_helper'

describe Deck do

  let(:new_author) { FactoryGirl.create(:user) }
  before do
    @deck = Deck.new(title: "a nice deck name", description: "Lorem ipsum", author_id: new_author.id, language: "english")
  end

  subject { @deck }

  it { should respond_to(:author_id)}
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:is_published)}
  it { should respond_to(:is_featured)}
  it { should respond_to(:price)}
  it { should respond_to(:rating)}
  it { should respond_to(:language)}
  it { should respond_to(:country)}
  it { should respond_to(:level)}
  it { should respond_to(:subject)}
  it { should respond_to(:chapter)}
  it { should respond_to(:difficulty)}
  it { should respond_to(:author)}
  it { should respond_to(:lessons)}
  it { should respond_to(:flashcards)}
  it { should respond_to(:questionnaires)}
  its (:author) { should eq new_author}

  it { should be_valid}

  describe "when author_id is not present" do
   	before {@deck.author_id = nil}
   	it { should_not be_valid}
  end
  describe "when language is not present" do
    before {@deck.language = nil}
    it { should_not be_valid}
  end
  describe "when title is not present" do
    before {@deck.title = nil}
    it { should_not be_valid}
  end
end