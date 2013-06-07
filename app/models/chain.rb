class Chain < ActiveRecord::Base
  attr_accessible :start_date, :link_rate, :title, :end_type, :num_left
	has_and_belongs_to_many :authors
  has_many :links

  validates_presence_of :start_date
  validates_presence_of :title
  validates_presence_of :link_rate
  validates_presence_of :end_type
  validates_presence_of :num_left

  def get_days 
    lr = self.link_rate
    days = []
    days << 0 if lr[0] == '1'
    days << 1 if lr[1] == '1'
    days << 2 if lr[2] == '1'
    days << 3 if lr[3] == '1'
    days << 4 if lr[4] == '1'
    days << 5 if lr[5] == '1'
    days << 6 if lr[6] == '1'
    return days
  end

  def successful_links(author_id)
    a = Author.find(author_id)
    if !self.authors.include?(a) 
      return []
    end

    def next_day(date, days)
      day = date.wday
      while !days.include?(day)
        day = (day+1)%7
        date = date+1
      end
      puts 'next day ' + date.to_s
      return date
    end

    s_links = []

    a_links = Link.where("author_id = ? AND chain_id = ?", a.id, self.id)
    curr_date = next_day(self.start_date.to_date, self.get_days)
    puts 'start date ' + curr_date.to_s

    while curr_date.to_date <= Date.today
      l = a_links.where('date BETWEEN ? AND ?', curr_date.beginning_of_day, curr_date.end_of_day)
      if l.length > 0
        s_links << { date: curr_date.to_date, link_id: l[0].id }
      else
        s_links << { date: curr_date.to_date, link_id: nil }
      end
      curr_date = next_day(curr_date.to_date+1, self.get_days)
    end

    return s_links.reverse

  end

  def successes
    successes = [0] * self.successful_links(authors[0].id).length

    self.authors.each do |a|
      sl = self.successful_links(a.id)
      sl.length.times do |i|
        successes[i] += 1 if sl[i][:link_id]
      end
    end

    return successes

  end

  def wordcount
    wc = 0
    self.links.each do |l|
      wc += l.wordcount
    end
    return wc
  end

end
