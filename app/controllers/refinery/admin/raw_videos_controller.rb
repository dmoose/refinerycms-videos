module Refinery
  module Admin
    class RawVideosController < Refinery::AdminController

      respond_to :html

      crudify :'refinery/raw_video',
              :title_attribute => 'title',
              :searchable => true,
              :sortable => false

      before_filter :init_dialog

      def create
        @raw_video = RawVideo.create_video(params)

        if @raw_video
          @raw_video.async_encode(:mp4, :ogv, :webm)
          flash[:notice] = t('encoding', :scope => 'refinery.admin.raw_videos', :title => @raw_video.title)
        end

        respond_with [:refinery_admin, @raw_video], :location => main_app.refinery_admin_raw_videos_path
      end
      alias_method :upload, :create

      # This renders the image insert dialog
      def insert
        self.new if @raw_video.nil?

        @url_override = main_app.refinery_admin_raw_videos_path(request.query_parameters.merge(:insert => true))

        if params[:conditions].present?
          extra_condition = params[:conditions].split(',')

          extra_condition[1] = true if extra_condition[1] == "true"
          extra_condition[1] = false if extra_condition[1] == "false"
          extra_condition[1] = nil if extra_condition[1] == "nil"
        end

        find_all_raw_videos(({extra_condition[0].to_sym => extra_condition[1]} if extra_condition.present?))
        search_all_raw_videos if searching?

        paginate_raw_videos

        render :action => 'insert'
      end

      def paginate_raw_videos
        @raw_videos = @raw_videos.paginate(:page => params[:page], :per_page => 10)
      end

      def init_dialog
        @app_dialog = params[:app_dialog].present?
        @field = params[:field]
        @update_image = params[:update_image]
        @thumbnail = params[:thumbnail]
        @callback = params[:callback]
        @conditions = params[:conditions]
      end

    end
  end
end
