class User < ActiveRecord::Base
  has_secure_password
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
  validates :username, presence: true

  def get_completed_count
    tab = []
	User.first.todo_items.each do |item|
	  if item.completed == true
	    tab << item
	  end
	end
	tab.count
  end
end
