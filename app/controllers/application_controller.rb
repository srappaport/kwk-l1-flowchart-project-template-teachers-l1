class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :'index.html'
  end

  get '/quiz/:id' do
    @quiz = Quiz.find_by_id(params[:id])
    @question = @quiz.questions.first

    erb :'quiz.html'
  end

  post '/quiz/:id' do
    @quiz = Quiz.find_by_id(params[:id])
    @next_step = @quiz.next_step(params[:next_step])

    if @next_step.is_a?(Result)
      redirect "/quiz/#{@quiz.id}/results/#{@next_step.id}"
    else
      @question = @next_step

      erb :'quiz.html'
    end
  end

  get "/quiz/:id/results/:result_id" do
    @quiz = Quiz.find_by_id(params[:id])
    @result = @quiz.find_result(params[:result_id])
    erb :"results.html"
  end
end
