module ApplicationHelper
    #index table sorting helper
    def sortable(column, title = nil)
        title ||= column.titleize
        direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
        link_to title, params.merge(:sort => column, :direction => direction)
    end
end