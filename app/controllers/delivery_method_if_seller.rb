class Delivery_Method_If_Seller < ActiveHash::Base
  self.data = [
  {id:1, name:"未定"}, 
  {id:2, name:"らくらくメルカリ便"}, 
  {id:3, name:"ゆうメール"}, 
  {id:4, name:"レターパック普通郵便(定形、定形外)"},
  {id:5, name:"クロネコヤマト"},
  {id:6, name:"ゆうパック"},
  {id:7, name:"クリックポスト"},
  {id:8, name:"ゆうパケット"}
  ]
end