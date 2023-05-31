class Api::Dashboard::DownloadController < AuthenticationController
  def download
    catch :error do
      if @current_user.type != "Admin"
        # except 400, ["Only admins can download actions"]
        render json: { error: "Only admins can download actions" }, status: 400
        return
      end
    end

    @actions = Action.all
    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["Username", "Name", "Description", "Time"]

      @actions.each do |action|
        csv << [action.user.username, action.name, action.description, action.time]
      end
    end

    send_data csv_data, type: "text/csv; charset=utf-8; header=present", disposition: "attachment; filename=actions.csv"
  end
end
