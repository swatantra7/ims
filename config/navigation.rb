SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.items do |primary|
    primary.item :manage, 'Manage', '#' do |secondary|
      secondary.item :member, 'Students', admin_members_path(course: Course.first.name) do |member|
        members_tabs(member)
        member.dom_class = 'nav nav-tabs'
        primary.dropdown = false
      end
    end
    primary.item :upload_images, 'Upload Images', admin_documents_path
    primary.item :course, 'Courses', admin_courses_path
    primary.dom_class = 'nav navbar-nav'
    primary.dropdown = true
    primary.split = false
  end
end