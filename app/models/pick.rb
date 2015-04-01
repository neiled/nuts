class Pick < ActiveRecord::Base
  include Workflow
  
  belongs_to :talent
  belongs_to :breakdown
  has_and_belongs_to_many :photos
  

  workflow do
    state :new do
      event :submit, :transitions_to => :submitted
    end
    state :submitted do
      event :booked, :transitions_to => :booked
    end
    state :booked do
      event :paid, :transitions_to => :paid
    end
    state :paid
  end  
end
