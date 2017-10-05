class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :groups
  belongs_to :user
  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    default_url: 'missing_cover.png'

  validates :name, presence: true
  validates_attachment_content_type :cover, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :publics, -> { where(draft: false) }
  scope :last_week, -> { where("created_at >= :date", date: 1.week.ago) }

  def get_authors
    names_arr = []
    self.authors.each { |author| names_arr << author.name }
    names_arr.join(', ')
  end
end
