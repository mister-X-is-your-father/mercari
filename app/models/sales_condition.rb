class SalesCondition < ActiveHash::Base
  self.data = [
    { id: 1, name: '出品中' }, { id: 3, name: '売却済' }
  ]
end