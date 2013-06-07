class Chain < ActiveRecord::Base
  attr_accessible :start_date, :link_rate, :num_links, :title, :end_time, :num_total
	has_and_belongs_to_many :authors
  has_many :links

  def get_days 
    lr = self.link_rate
    days = []
    days << 'Sunday' if lr[0] == '1'
    days << 'Monday' if lr[1] == '1'
    days << 'Tuesday' if lr[2] == '1'
    days << 'Wednesday' if lr[3] == '1'
    days << 'Thursday' if lr[4] == '1'
    days << 'Friday' if lr[5] == '1'
    days << 'Saturday' if lr[6] == '1'
    return days
  end

  def successful_links(author_id)
    a = Author.find(author_id)
    if !self.authors.include?(a) return 0

    def next

    a_links = Link.where("author_id = ? AND chain_id = ?", a.id, self.id)
    curr_date = c.start_date
    while curr_date.to_date <= Date.today

    end
  end

end
