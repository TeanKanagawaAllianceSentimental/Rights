module TopHelper
	def _back_url
        _filtered_referrer || "javascript:history.back()"
      end
      protected :_back_url
end
