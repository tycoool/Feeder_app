namespace :update_employees_reputation_task do

  # rake update_employees_reputation_task:update
  desc "Updates employees reputations"
  task :update => :environment do
    Employee.all.each do |empl|
      ComputeEmployeesReputationService.new(empl.id).perform
    end
    puts ""
    puts "----- All reputations updated -----"
    puts ""
  end

end
