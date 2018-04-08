module Api
  class CreateEventRequest

    def initialize(params)
      @title       = params[:title]
      @description = params[:description]
      @caption     = params[:caption]
      @event_date  = params[:event_date]
      @timeline_id = params[:timeline_id]
    end

    def create
      Event.create(title:       @title,
                   description: @description,
                   caption:     @caption,
                   event_date:  @event_date,
                   timeline_id: @timeline_id)
    end

  end
end