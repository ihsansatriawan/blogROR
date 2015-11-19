require 'rails_helper'

describe Article do
	it "has a valid factory" do
		expect(FactoryGirl.build(:article)).to be_valid
	end

	it "is valid with a title and body" do
		article = Article.new(
			title: "This is a title",
			body: "lorem ipsum")

		expect(article).to be_valid
	end

	it "is invalid without a title" do
		article = FactoryGirl.build(:article, title: nil)
		article.valid?

		expect(article.errors[:title]).not_to include("Title can't be blank")
	end

	it "is invalid without a body" do
		article = FactoryGirl.build(:article, body: nil)
		article.valid?

		expect(article.errors[:title]).not_to include("Body can't be blank")
	end
	
	it "is invalid without a title and a body" do
		article = FactoryGirl.build(:article, title:nil, body: nil)
		article.valid?

		expect(article.errors[:title]).not_to include("Title can't be blank Body can't be blank")
	end

	it "returns article full content as a string" do
		article = FactoryGirl.build(:article,
			title: "HijUp",
			body: "Islamic E-Commerce Indonesia")

		expect(article.full_content).to eq 'HijUp Islamic E-Commerce Indonesia'
	end

	describe "filter title by letter" do
		before :each do
			@ihsan = Article.create(
				title: "ihsan",
				body: "ihsan")
			@imam = Article.create(
				title: "imam",
				body: "imam")
			@detik = Article.create(
				title: "detik",
				body: "detik")
		end
		context "with matching letters" do
			it "returns a sorted array of results that match" do
				expect(Article.by_letter("i")).to eq [@ihsan, @imam]
			end
		end
		context "with non-matching letter" do
			it "omits results that do not match" do
				expect(Article.by_letter("i")).not_to include @detik
			end
		end
	end
end