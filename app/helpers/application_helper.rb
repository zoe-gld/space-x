module ApplicationHelper
  def available_categories
    ['concert hall', 'movie theater', 'house', 'cave', 'museum', 'art gallery', 'aquarium']
  end

  def empty_reviews(space)
    space.bookings.map { |booking| booking.reviews.count }.sum.zero?
  end
end
