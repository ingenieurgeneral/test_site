require 'spec_helper'
describe User do
	before do
		@user = User.new(first_name: "John", last_name: "Smith", email: "user@example.com", password: "foobar12", password_confirmation: "foobar12", language: "english")
	end
	subject { @user }
	it { should respond_to(:first_name) }
	it { should respond_to(:last_name)}
	it { should respond_to(:fullname)}
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:admin) }
	it { should respond_to(:authored_decks)}
	it { should respond_to(:deckrelationships)}
	it { should respond_to(:followed_decks)}
	it { should respond_to(:following?)}
	it { should respond_to(:follow!)}
	it { should respond_to(:unfollow!)}
	it { should respond_to(:cardrelationships)}
	it { should respond_to(:lessons)}
	it { should respond_to(:flashcards)}
	it { should respond_to(:questionnaires)}
	it { should be_valid }
	it { should_not be_admin }
	describe "with admin attribute set to 'true'" do
		before do
			@user.save!
			@user.toggle!(:admin)
		end
		it { should be_admin }
	end
	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end
	describe "when firstname is too long" do
		before { @user.first_name = "a" * 51 }
		it { should_not be_valid }
	end
	describe "when lastname is too long" do
		before { @user.last_name = "a" * 51 }
		it { should_not be_valid }
	end
	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end
	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end
	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.save
		end
		it { should_not be_valid }
	end
	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid }
	end
	describe "when password is not present" do
		before do
			@user = User.new(first_name: "Example", last_name: "User", email: "user@example.com", password: " ", password_confirmation: " ", language: "english")
		end
		it { should_not be_valid }
	end
	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end
	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end
	describe "following" do
		let(:some_deck) { Deck.create(title: "my little deck", author_id: 1, language: "english") }
		before do
			@user.save
			@user.follow!(some_deck)
		end
		it { should be_following(some_deck) }
		its(:followed_decks) { should include(some_deck) }
		describe "followed deck" do
			subject { some_deck }
			its(:followers) { should include(@user) }
		end
		describe "and unfollowing" do
		before { @user.unfollow!(some_deck) }
		it { should_not be_following(some_deck) }
		its(:followed_decks) { should_not include(some_deck) }
		end
	end
end