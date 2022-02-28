class AddPaypalPlanNameToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :paypal_plan_name, :string
  end
end
