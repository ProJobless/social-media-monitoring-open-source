class Account < ActiveRecord::Base
  serialize :organization_list, Array
  has_many :organizations, dependent: :nullify
  has_many :users, dependent: :nullify
  belongs_to :account_type
  belongs_to :country
  has_and_belongs_to_many :resellers
  has_many :keywords, :through => :organizations
  attr_accessible :name, :firstname, :lastname, :phone, :organizations, :account_type_id, :country_code_id, :postalcode, :street, :street1, :state, :web, :city, :country_id

  validates :name, :presence => true

  def organization_list
    if organization_list.length > 0
      self.organizations
    else
      organization_ids = self.organizations.map { |r| r.id }.flatten
      self.organization_list = organization_ids
    end
  end

  def contact_person
    self.firstname + " " + self.lastname
  end

end
