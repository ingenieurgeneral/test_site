require 'spec_helper'
describe Lesson do

	let(:deck) { Deck.create(title: "voila un deck", author_id: 1, language: "english") }
	before { @lesson=deck.lessons.build(content: "Lorem ipsum", title: "mon titre")}
	subject { @lesson }

	it { should respond_to(:deck_id)}
	it { should respond_to(:title)}
	it { should respond_to(:content)}
	it { should respond_to(:is_featured?)}
	its(:deck) { should eq deck}

	it { should be_valid }

	describe "when deck_id is not present" do
		before { @lesson.deck_id = nil }
		it { should_not be_valid }
	end
	describe "when content is not present" do
		before { @lesson.content = nil }
		it { should_not be_valid }
	end
	describe "when title is not present" do
		before { @lesson.title = nil }
		it { should_not be_valid }
	end
end