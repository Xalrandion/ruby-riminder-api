require_relative 'requtils.rb'

class Source
    @clientw

    def initialize(clientw)
        @clientw = clientw
    end

    def list()
        resp = @clientw.get("sources")
        return resp['data']
    end

    def get(source_id)
        query = {}
        if (source_id.is_a?(Hash))
            ReqUtils.add_if_not_blank(query, 'source_id', source_id['source_id'])
        else
            query["source_id"] = source_id
        end
        resp = @clientw.get("source", query)
        return resp['data']
    end
end