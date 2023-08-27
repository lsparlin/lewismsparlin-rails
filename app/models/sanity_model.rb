class SanityModel
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :_id, :string
  attribute :_type, :string
  attribute :_createdAt, :string
  attribute :_updatedAt, :string
  attribute :_rev, :string
end
