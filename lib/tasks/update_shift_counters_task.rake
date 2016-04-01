namespace :update_shift_counters_task do

  # rake update_shift_counters_task:update_starting_from_fulfillments
  desc "Just updates shift counters"
  task :update_starting_from_fulfillments => :environment do
    # Very time intensive strategy (we need a new one that starts from users too)
    Fulfillment.includes(:shift).each do |fl|
      # Consider only shifts that are by now inactive
      if (fl.status == "scheduled" and (fl.shift.status == "inactive"))
        ComputeShiftsCountersService.new(location_id = fl.location_id ,
                                        customer_id = fl.customer_id,
                                        employee_id = fl.employee_id).perform
        puts "#{fl.id} fulfillment processed."
      end
    end
    puts "--update_starting_from_fulfillments--"
  end

end
