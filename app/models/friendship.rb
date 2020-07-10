class Friendship < ApplicationRecord
  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol.
  # The first argument is the plural symbol name of your target model.
  # acts_as_notifiable :users,
  #   # Notification targets as :targets is a necessary option
  #   # Set to notify to author and users commented to the article, except comment owner self
  #   targets: :custom_notification_targets,
  #   # Path to move when the notification is opened by the target user
  #   # This is an optional configuration since activity_notification uses polymorphic_path as default
  #   notifiable_path: :article_notifiable_path

  # def custom_notification_targets(key)
  #   if key == 'friendship.get_friend_request'
  #     [self.user]
  #   end
  # end

  # def article_notifiable_path
  #   article_path(article)
  # end
end
