class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos,
    reject_if: proc { |attributes| attributes[:image].blank? }, allow_destroy: true

  enum home_type: [:"nhà riêng", :"khách sạn", :"Khu chung cư"]
  enum room_type: [:"phòng riêng", :"phòng chung"]
  enum province: [:"An Giang", :"Bà Rịa - Vũng Tàu", :"Bạc Liêu", :"Bắc Cạn",
    :"Bắc Giang", :"Bắc Ninh", :"Bến tre", :"Bình Dương", :"Bình Định",
    :"Bính Phước", :"Bình Thuận", :"Cà Mau", :"Cần Thơ",:"Đà Nẵng",
    :"Đắk Lắk",:"Đắk Nông", :"Đồng Nai", :"Đồng Tháp",
    :"Điện Biên", :"Gia Lai", :"Hà Giang", :"Hà Nam",
    :"Hà Nội", :"Hà Tĩnh", :"Hải Dương", :"Hải Phòng", :"Hòa Bình", :"Hậu Giang",
    :"Hưng Yên", :"TP. Hồ Chí Minh", :"Khánh Hòa", :"Kiên Giang", :"Kon Tum",
    :"Lai Châu", :"Lào Cai", :"Lạng Sơn", :"Lâm Đồng", :"Long An", :"Nam Định",
    :"Nghệ An", :"Ninh Bình", :"Ninh Thuận", :"Phú Thọ", :"Phú Yên", :"Quảng Bình",
    :"Quảng Nam", :"Quảng Ngãi", :"Quảng Ninh", :"Quảng Trị", :"Sóc Trăng", :"Sơn La",
    :"Tây Ninh", :"Thái Bình", :"Thái Nguyên", :"Thanh Hóa", :"Thừa Thiên - Huế",
    :"Tiền Giang", :"Trà Vinh", :"Tuyên Quang", :"Vĩnh Long", :"Vĩnh Phúc", :"Yên Bái"]
end
