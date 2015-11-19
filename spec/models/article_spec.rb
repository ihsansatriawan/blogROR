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

	it "returns a sorted array of results that match" do
		ihsan = Article.create(
			title: "ihsan",
			body: "ihsan",
			created_at: Time.now,
			updated_at: Time.now)
		imam = Article.create(
			title: "imam",
			body: "imam",
			created_at: Time.now,
			updated_at: Time.now)
		detik = Article.create(
			title: "detik",
			body: "detik",
			created_at: Time.now,
			updated_at: Time.now)

		expect(Article.by_letter("i")).to eq [ihsan, imam]
	end
end