class Room < ApplicationRecord

	$CITYS = ["An Giang","Bà Rịa - Vũng Tàu","Bắc Giang","Bắc Kạn","Bạc Liêu","Bắc Ninh","Bến Tre","Bình Định","Bình Dương","Bình Phước","Bình Thuận","Cà Mau","Cao Bằng","Đắk Lắk","Đắk Nông","Điện Biên","Đồng Nai","Đồng Tháp","Gia Lai","Hà Giang","Hà Nam","Hà Tĩnh","Hải Dương","Hậu Giang","Hòa Bình","Hưng Yên","Khánh Hòa","Kiên Giang","Kon Tum","Lai Châu","Lâm Đồng","Lạng Sơn","Lào Cai","Long An","Nam Định","Nghệ An","Ninh Bình","Ninh Thuận","Phú Thọ","Quảng Bình","Quảng Nam","Quảng Ngãi","Quảng Ninh","Quảng Trị","Sóc Trăng","Sơn La","Tây Ninh","Thái Bình","Thái Nguyên","Thanh Hóa","Thừa Thiên Huế","Tiền Giang","Trà Vinh","Tuyên Quang","Vĩnh Long","Vĩnh Phúc","Yên Bái","Phú Yên","Cần Thơ","Đà Nẵng","Hải Phòng","Hà Nội","TP HCM"]
    validates :province , inclusion: $CITYS    
    
    validates :room_info, presence: true 
    
    validate do |record|
        record.validate_photo_quota
    end
    
    mount_uploaders :pictures, RoomImageUploader
    belongs_to :user
    serialize :pictures, JSON
    
    has_many :comments
    has_many :ratings
    has_many :bookmarks
    
    scope :top_rated, -> {
        Room.left_joins(:ratings)
            .group(:id)
            .order('avg (ratings.stars) desc')
            .limit(10)
    }
    
    def is_bookmarked user
        if user
            Bookmark.find_by(user_id: user.id, room_id: id) 
        end
    end
    
    def validate_photo_quota
    #   return unless self.user
    #   if self.pictures.count > 5
    #     errors.add(:error, "Over quota")
    #   end
    end
end
