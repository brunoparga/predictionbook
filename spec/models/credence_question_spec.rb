require 'spec_helper'

describe CredenceQuestion do
  it 'should know right from wrong' do
    q1 = create_valid_credence_question(correct_index: 0)
    expect(q1.answer_correct?(1)).to eq false
    expect(q1.answer_correct?(0)).to eq true

    q2 = create_valid_credence_question(correct_index: 1)
    expect(q2.answer_correct?(1)).to eq true
    expect(q2.answer_correct?(0)).to eq false
  end

  it 'should give correct scores to specific credences' do
    q = create_valid_credence_question(correct_index: 1)

    right_scores = { 50 => 0, 51 => 3, 60 => 26, 70 => 49,
                     80 => 68, 90 => 85, 99 => 99 }
    wrong_scores = { 50 => 0, 51 => -3, 60 => -32, 70 => -74,
                     80 => -132, 90 => -232, 99 => -564 }

    right_scores.each do |cred, score|
      expect(q.score_answer(1, cred)).to eq [true, score]
    end

    wrong_scores.each do |cred, score|
      expect(q.score_answer(0, cred)).to eq [false, score]
    end
  end

  it 'should create random questions' do
    pending "Can I test this without a db?"
    raise "not yet implemented"
  end
end
