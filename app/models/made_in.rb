class MadeIn < ActiveHash::Base
  self.data = [
    { id: 1, name: '▽'},
    { id: 2, name: 'JAPAN'}
  ]

  include ActiveHash::Associations
  has_many :products

end