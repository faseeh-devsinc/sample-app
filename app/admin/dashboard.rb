ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      # span class: 'blank_slate' do
      #   span I18n.t('active_admin.dashboard_welcome.welcome')
      #   small I18n.t('active_admin.dashboard_welcome.call_to_action')
      # end
    end

    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel 'Recent Users' do
          ul do
            User.order('activated_at desc').limit(5).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel 'Recent Posts' do
          ul do
            Micropost.order('created_at desc').limit(5).map do |post|
              li link_to(post.content, admin_micropost_path(post))
            end
          end
        end
      end

    end
  end



end
