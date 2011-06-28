class Task < ActiveRecord::Base
  belongs_to :bucket
  scope :pending, where(["done=? or done isnull",false])
  scope :completed, where(:done=>true)
  validates_presence_of :title
  def complete
    unless(self.done)
      self.done=true
      self.completed_at = Time.now
      self.save
    else
      false
    end
  end
end
