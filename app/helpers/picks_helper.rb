module PicksHelper
    def get_pick_state_change_button(pick)
        
        case pick.current_state
        when :new
            link_to "Submit", pick_path(pick, workflow_state: "Submitted"),  class: "btn btn-primary", method: :patch
        end
    end
end
