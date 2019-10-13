class ReportsController < ApplicationController

  def day_wise_result
     @readings = Patient.day_wise(current_user)
   end

   def month_to_date_result
     @readings = Patient.month_to_date_wise(current_user,params)
   end

   def month_wise_result
     @readings = Patient.month_wise(current_user,params)
   end
end
