module MessagesHelper
  def random_message
    rand(1..Message.last.id)
  end
end
