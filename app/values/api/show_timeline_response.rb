module Api
  class ShowTimelineResponse

    def initialize(params)
      @timeline_id = params[:id]
    end

    def show
      Timeline.includes(:events).find(@timeline_id)
    end
  end
end