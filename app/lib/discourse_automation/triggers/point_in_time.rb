# frozen_string_literal: true

DiscourseAutomation::Triggerable::POINT_IN_TIME = 'point_in_time'

DiscourseAutomation::Triggerable.add(DiscourseAutomation::Triggerable::POINT_IN_TIME) do
  on_update do |automation, metadata|
    # prevents creating a new pending automation on save when date is expired
    if Time.parse(metadata[:execute_at]) > Time.zone.now
      automation
        .pending_automations
        .create!(execute_at: metadata[:execute_at])
    end
  end
end
