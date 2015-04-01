module PicksHelper
    def get_pick_state_change_button(pick)
        
        case pick.state
        when :new
            link_to "Submit", pick_path(pick, state: "Submitted"),  class: "btn btn-primary", method: :patch
        end
    end
end
