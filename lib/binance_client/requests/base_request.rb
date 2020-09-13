module BinanceClient
  class BaseRequest
    include APIClientBase::Request.module

    attribute :api_key, String
    attribute :api_secret, String

    def signature(query)
      OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new("sha256"),
        api_secret,
        query,
      )
    end

    def timestamp
      DateTime.now.strftime("%Q")
    end
  end
end
