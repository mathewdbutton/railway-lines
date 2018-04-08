module Api
  class TimelinesController < ApplicationController
    def index
    end

    def show
      timeline = ShowTimelineResponse.new(params).show
      render json:TimelineSerializer.new(timeline,{include: [:events]}).serializable_hash
    end
  end
end