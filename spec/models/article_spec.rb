require 'rails_helper'

describe Article do
	it "is valid with a title and body" do
		article = Article.new(
			title: "This is a title",
			body: "lorem ipsum")

		expect(article).to be_valid
	end

	it "is invalid without a title" do
		article = Article.new(title: nil)
		article.valid?

		expect(article.errors[:title]).not_to include("Title can't be blank")
	end

	it "is invalid without a body" do
		article = Article.new(body: nil)
		article.valid?

		expect(article.errors[:title]).not_to include("Body can't be blank")
	end
	
	it "is invalid without a title and a body" do
		article = Article.new(body: nil,
			body: nil)
		article.valid?

		expect(article.errors[:title]).not_to include("Title can't be blank Body can't be blank")
	end

	it "returns article full content as a string" do
		article = Article.new(
			title: "HijUp",
			body: "Islamic E-Commerce Indonesia")

		expect(article.full_content).to eq 'HijUp Islamic E-Commerce Indonesia'
	end
end