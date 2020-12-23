class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: ' ', icon: ' ' },
    { id: 1, name: '観光', icon: '<i class="fas fa-map-marker-alt fa-lg fa-fw"></i>' },
    { id: 2, name: '施設', icon: '<i class="fas fa-landmark fa-lg fa-fw"></i>' },
    { id: 3, name: '体験', icon: '<i class="fas fa-star fa-lg fa-fw"></i>' },
    { id: 4, name: '食事', icon: '<i class="fas fa-utensils fa-lg fa-fw"></i>' },
    { id: 5, name: '宿泊', icon: '<i class="fas fa-bed fa-lg fa-fw"></i>' },
    { id: 6, name: '徒歩', icon: '<i class="fas fa-walking fa-lg fa-fw"></i>' },
    { id: 7, name: 'バス', icon: '<i class="fas fa-bus fa-lg fa-fw"></i>' },
    { id: 8, name: '鉄道', icon: '<i class="fas fa-subway fa-lg fa-fw"></i>' },
    { id: 9, name: '飛行機', icon: '<i class="fas fa-plane fa-lg fa-fw fa-rotate-315"></i>' },
    { id: 10, name: '船', icon: '<i class="fas fa-ship fa-lg fa-fw"></i>' },
    { id: 11, name: '車', icon: '<i class="fas fa-car-alt fa-lg fa-fw"></i>' },
    { id: 12, name: '自転車', icon: '<i class="fas fa-bicycle fa-lg fa-fw"></i>' },
    { id: 13, name: 'のりかえ（駅・空港など）', icon: '<i class="fas fa-random fa-lg fa-fw"></i>' }
  ]

  include ActiveHash::Associations
  has_many :spots
end
