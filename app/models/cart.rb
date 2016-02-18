class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user
   belongs_to :order
   has_one :status, through: :order

   
end #ends class
