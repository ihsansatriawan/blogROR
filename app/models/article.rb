class Article < ActiveRecord::Base
	validates :title, :body, presence: true

	def full_content
		[title, body].join(' ')
	end

	def self.by_letter(letter)
		where("title LIKE ?", "#{letter}%").order(:title)
	end
end
