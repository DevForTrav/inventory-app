# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Rake.application["db:fixtures:load"].invoke

user = User.find_or_create_by(email: "travis@angry-fly.com") do |user|
  user.update(first_name: 'Travis', last_name: 'Courtney', password: 'password', password_confirmation: 'password', role: 'admin')
end

wiring_harness = WiringHarness.create(name: 'ri dash can', company: 'centurion', weekly_quota: 10, harnesses_completed: 1, user_id: user.id)

connectors = Connector.create([
  { name: "12 socket", part_number: 'DT06-12S', company: "TE Connectivity" },
  { name: "Amp Seal", part_number: '770680PV', company: "TE Connectivity" }
])

terminals = Terminal.create([
  { name: 'DT Female', abbreviation: 'AT62-14 FEMALE', quantity: 56000, connector_id: connectors.first.id},
  { name: 'SPLICE', abbreviation: 'SPLICE', quantity: 1000 },
  { name: '770854-1', abbreviation: '770854-1', quantity: 1000, connector_id: connectors.second.id}
])

uncut_wires = UncutWire.create([
 {gauge: '16g', primary_color: 'red', secondary_color: '', length_in_cm: 9000, date_ordered: Date.today, part_number: "red_wire", status: "in stock"},
 {gauge: '16g', primary_color: 'blk', secondary_color: '', length_in_cm: 9000, date_ordered: Date.today, part_number: "blk_wire", status: "in stock"},
 {gauge: '16g', primary_color: 'pur', secondary_color: 'wht', length_in_cm: 9000, date_ordered: Date.today, part_number: "pur_wht_wire", status: "in stock"}
])

circuits = Circuit.create([
  { number: "#2", position: ['1'], length: 8, p1_terminal_id: terminals.first.id, p2_terminal_id: terminals.second.id, quantity: 1, uncut_wire_id: uncut_wires.first.id },
  { number: "#1", position: ['2'], length: 10, p1_terminal_id: terminals.first.id, p2_terminal_id: terminals.second.id, quantity: 1, uncut_wire_id: uncut_wires.second.id },
])

wiring_harness_connectors = WiringHarnessConnector.create([
  { wiring_harness_id: wiring_harness.id, connector_id: connectors.first.id},
  { wiring_harness_id: wiring_harness.id, connector_id: connectors.second.id}
])