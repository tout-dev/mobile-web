require_relative '../user'

module ITout
  module API
    module Me
      # implements http://developer.tout.com/api-overview/me-api

      # implements http://developer.tout.com/api/me-api/apimethod/retrieve-authenticated-user
      def get_me
        ITout::User.new.from_response(get("me"))
      end

      # implements http://developer.tout.com/api/me-api/apimethod/retrieve-sharing-settings
      def get_my_fb_sharing_settings
        response = get("me/sharing/facebook")
        JSON.parse(response.body)
      end

      # implements http://developer.tout.com/api/me-api/apimethod/retrieve-list-touts-authenticated-user
      def get_my_touts(order="most_recent_first", per_page=nil, page=nil)
        response = get("me/touts", query: {order: order, per_page: per_page, page: page})
        ITout::Touts.new.from_response(response)
      end

      def get_my_liked_touts(order="most_recent_first", per_page=nil, page=nil)
        response = get("me/likes", query: {order: order, per_page: per_page, page: page})
        ITout::Touts.new.from_response(response)
      end

      def friends(order=nil, per_page=nil, page=nil)
        response = get("me/friends", query: {order: order, per_page: per_page, page: page})
        ITout::Users.new.from_response(response)
      end

    end
  end
end
