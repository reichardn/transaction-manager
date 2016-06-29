class Task < ActiveRecord::Base
  
  belongs_to :deal
  validates_presence_of :description, :deal_id

end