class Address < ActiveRecord::Base
  has_many :testeds

  default_scope { order(id: :desc) }

  scope :only_working, -> () { where(deleted: false).where(switched: true) }

  scope :without_deleted, -> () { where(deleted: false) }

end
