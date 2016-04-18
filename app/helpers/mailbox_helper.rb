module MailboxHelper
  def unread_messages_count
    mailbox.inbox(unred: true).count(:id, distinct: true)
  end
end
