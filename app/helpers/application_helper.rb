module ApplicationHelper
  def random_message
    ids = []
    Message.all.each do |m|
      ids << m.id
    end
    chosen_id = rand(ids.size)
    Message.find_by(id: ids[chosen_id])
  end
end
