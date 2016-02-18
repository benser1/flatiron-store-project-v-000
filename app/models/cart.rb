class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user
   belongs_to :order
   has_one :status, through: :order

   def total
      # line_items.quantity * items.price
      line_items.collect do |line_item| 
         line_item.quantity * line_item.item.price
      end.inject(:+)
   end

   def add_item(item)
      new_item = line_items.find_by(id: item)

      if new_item
         new_item.quantity += 1
      else 
         new_item = self.line_items.build(item_id: item)
         new_item.quantity = 1
      end
      new_item
   end ## add item end



end #ends class
