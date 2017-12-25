class Expense < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :pst, presence: true, numericality: { only_integer: true }
  validates :gst, presence: true, numericality: { only_integer: true }

  belongs_to :expensable, polymorphic: true

  belongs_to :project
  belongs_to :project_task
  belongs_to :project_sub_task

  has_one :image, as: :imagable, validate: false, :dependent => :destroy

  accepts_nested_attributes_for :image, :allow_destroy => true

end
