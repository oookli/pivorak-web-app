module Admin
  class TalksController < BaseController
    helper_method :talk, :talks

    def new
      @talk = Talk.new
    end

    def create
      @talk = Talk.new(talks_params)

      talk.save ? redirect_to(talk) : render(:new)
    end

    def update
      talk.update(talks_params) ? redirect_to(talk) : render(:edit)
    end

    private

    def talk
      @talk ||= Talk.friendly.find(params[:id])
    end

    def talks
      @talks ||= Talk.includes(:event, :speaker)
    end

    def talks_params
      params.require(:talk).permit(:title, :description, :event_id, :speaker_id, :video_url, :slides_url)
    end
  end
end
