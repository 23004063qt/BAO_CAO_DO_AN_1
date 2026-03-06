require 'net/http'
require 'uri'
require 'json'

class ChatController < ApplicationController
  def create
    body = JSON.parse(request.body.read)

    uri = URI("https://api.groq.com/openai/v1/chat/completions")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Post.new(uri)
    req["Content-Type"]  = "application/json"
    req["Authorization"] = "Bearer nhapkey"
    req.body = {
      model:    "llama-3.3-70b-versatile",
      messages: [
        { role: "system", content: body["system"] },
        *body["messages"]
      ]
    }.to_json

    res = http.request(req)
    data = JSON.parse(res.body)

    text = data.dig("choices", 0, "message", "content")
    render json: { content: [{ text: text }] }
  end
end