module PicksHelper
    def get_pick_state_change_button(pick)

        case pick.workflow_state
        when "new"
            link_to "Submit", pick_path(pick, workflow_state: "Submitted"),  class: "btn btn-primary", method: :patch
        when "Submitted"
            link_to "Booked", pick_path(pick, workflow_state: "Booked"),  class: "btn btn-primary", method: :patch
        when "Booked"
            link_to "Booked", "#", class: "btn btn-primary disabled", method: :patch
        end
    end
end
