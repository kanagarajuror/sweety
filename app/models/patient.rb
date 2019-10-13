class Patient < ApplicationRecord
  belongs_to :user
  validates :reading_value, presence: true
  scope :today_readings, ->{ where("date(created_at) = ?", Time.now.strftime("%Y-%m-%d").to_date)}
  scope :today_result, ->{ where("date(created_at) = ?", Time.now.to_date.strftime("%Y-%m-%d"))}
  scope :between_date, ->(begin_date, end_date){ where("date(created_at) between ? and ?",begin_date, end_date)}

  def self.check_count(user)
    result = user.patients.today_readings.count
    if result < 4
      return false
    else
      return true
    end
  end

  def self.day_wise(user)
    total = user.patients.today_result
    return [total.minimum(:reading_value).to_i, total.maximum(:reading_value).to_i, total.average(:reading_value).to_i]
  end

  def self.month_to_date_wise(user, params={})
    end_date = get_date(params["reading"])
    begin_date = end_date.beginning_of_month
    total = user.patients.between_date(begin_date,end_date)
    return [total.minimum(:reading_value).to_i, total.maximum(:reading_value).to_i, total.average(:reading_value).to_i]
  end

  def self.month_wise(user, params={})
    begin_date = get_date(params["reading"])
    end_date = begin_date.end_of_month
    total = user.patients.between_date(begin_date,end_date)
    return [total.minimum(:reading_value).to_i, total.maximum(:reading_value).to_i, total.average(:reading_value).to_i]
  end

  def self.get_date(reading_date)
    return Date.new(reading_date["created_at(1i)"].to_i,reading_date["created_at(2i)"].to_i,reading_date["created_at(3i)"].to_i)
  end
end
