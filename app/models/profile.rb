class Profile < ActiveRecord::Base
    belongs_to :user
    
    validate :lastname_xor_firstname
    def lastname_xor_firstname
      if last_name.blank? and first_name.blank?
        errors.add :base, "Error message"
      end    
    end

  validates :gender, inclusion: { in: %w(male female),
      message: "Gender has not the right value" }

  validate :firstname_sue
  def firstname_sue
    if gender == "male" and first_name == "Sue"
      errors.add :base, "Error message"
    end
  end

  def self.get_all_profiles min, max
    min = 1960
    max = 1985
    Profile.where("birth_year BETWEEN :min_year AND :max_year", min_year: min, max_year: max).order(:birth_year)
  end

end
# Profile.get_all_profiles