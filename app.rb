require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do 
    "#{params[:name].reverse}"
  end

  get '/square/:number' do
    "#{params[:number].to_i ** 2}"
  end

  get '/say/:number/:phrase' do 
    "#{params[:phrase] * params[:number].to_i}"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do 
    params.values.join(' ') + '.'
  end

  get '/:operation/:number1/:number2' do
    ops = {'add' => Proc.new{|a, b| a + b},
           'subtract' => Proc.new{|a, b| a - b},
           'multiply' => Proc.new{|a, b| a * b},
           'divide' => Proc.new{|a, b| a / b}}
    "#{ops[params[:operation]].call(params[:number1].to_i, params[:number2].to_i)}"
  end

end