class Quiz
  attr_accessor :id, :title, :questions, :results
  @@all = []

  def initialize(id, title)
    @id = id
    @questions = []
    @results = []
    @title = title
    save
  end

  def self.find_by_id(id)
    @@all.detect{|q| q.id.to_s == id.to_s}
  end

  def self.all
    @@all
  end

  def next_step(step_id)
    if step_id.start_with?("Q")
      find_question(step_id)
    elsif step_id.start_with?("R")
      find_result(step_id)
    end
  end

  def find_question(step_id)
    @questions.detect{|q| q.id == step_id}
  end

  def find_result(step_id)
    @results.detect{|r| r.id == step_id}
  end

  def save
    @@all << self
  end

  def add_question(question)
    self.questions << question
  end

  def add_result(result)
    self.results << result
  end
end
