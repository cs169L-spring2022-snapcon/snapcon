Given /I have my test database setup/ do
    execute_rake('demo_data_for_development.rake', 'data:test')
end
When /I click the "(.*)" link of.*"(.*)"/ do |button, data|         
    if button == "Schedule"
        click_link(button, href: vertical_schedule_conference_schedule_path(data))
    else
        within('.dropdown > .dropdown-menu') do 
            click_link("Edit Profile")
        end         
    end
end

def execute_rake(file, task)
    require 'rake'
    rake = Rake::Application.new
    Rake.application = rake
    Rake::Task.define_task(:environment)
    load "#{Rails.root}/lib/tasks/#{file}"
    rake[task].invoke
end