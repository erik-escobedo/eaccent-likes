ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Posts" do
          table do
            tr do
              th 'id'
              th 'Author'
              th 'Title'
              th 'Total points'
            end

            Post.with_total_points.each do |post|
              tr do
                td post.id
                td post.user.name
                td post.title
                td post.total_points
              end
            end
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
