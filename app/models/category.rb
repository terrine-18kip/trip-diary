class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: ' ' },
    { id: 1, name: '観光' },
    { id: 2, name: '施設' },
    { id: 3, name: '体験' },
    { id: 4, name: '食事' },
    { id: 5, name: '宿泊' },
    { id: 6, name: '徒歩' },
    { id: 7, name: 'バス' },
    { id: 8, name: '鉄道' },
    { id: 9, name: '飛行機' },
    { id: 10, name: '船' },
    { id: 11, name: '車' },
    { id: 12, name: '自転車' },
    { id: 13, name: 'のりかえ（駅・空港など）' }
  ]

  include ActiveHash::Associations
  has_many :spots
end