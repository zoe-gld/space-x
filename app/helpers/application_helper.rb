module ApplicationHelper
  def available_categories
    ['concert hall', 'movie theater', 'house', 'cave', 'museum', 'art gallery', 'aquarium']
  end

  def url_converter(space)
    return if space.video_url.nil?

    input_url = space.video_url
    split = input_url.split('/')
    id = split.last
    "https://www.youtube.com/embed/#{id}"
  end

  def avatar(user)
    if user.avatar.file.nil?
      asset_path("user.png")
    else
      user.avatar.url
    end
  end

  def taken_dates(space)
    space.bookings.map {|booking| booking.date}.to_json
  end

  def aggregate_reviews(space)
    reviews = []
    space.bookings.each do |booking|
      booking.reviews.each do |review|
        reviews << review
      end
    end
    reviews.sort_by{|review| review.rating}.reverse
  end

  def average_rating(reviews)
    reviews.empty? ? 0 : (reviews.sum{|review| review.rating} / reviews.count.to_f).round(1)
  end

  def sorted!(spaces)
    spaces.sort_by {|space| average_rating(aggregate_reviews(space))}.reverse
  end

end
