require 'sinatra'
require 'csv'

get '/' do
  erb :index
end

get '/vote' do
  @name = params["name"]
  @vote = params["vote"]
  CSV.open("vote.csv", "a") do |row|
    row << [@name, @vote]
  end
  erb :vote
end

get '/result' do
    # 한줄 한줄 데이터를 읽고 row라는 임시변수에 담는다
    # 밑 코드 둘 다 빈 배열을 만듦 / 둘의 기능이 조금씩 다르다
    @list = Array.new
    @list = []

    @count = Hash.new(0)
    # @count = {"1hour" => 0, "2hour" => 0, "3hour" => 0}

    CSV.foreach("vote.csv") do |row|
     # <<기호는 배열에 값을 넣어주는 기능
      @list << row
      if row[1] == "1"
        @count["1hour"] +=1
      elsif row[1] == "2"
        @count["2hour"] +=1
      elsif row[1] == "3"
        @count["3hour"] +=1
      end
    end

  erb :result
end
