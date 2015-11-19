class Article < ActiveRecord::Base
	validates :title, :body, presence: true

	def full_content
		[title, body].join(' ')
	end
end
