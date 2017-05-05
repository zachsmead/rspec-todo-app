require 'rails_helper'

RSpec.describe Task, type: :model do

  describe "#toggle_complete" do
  	it 'should change the complete boolean to its opposite' do
  		task = Task.new(complete: true)
  		task.toggle_complete!
  		expect(task.complete).to eq(false)
  	end
  end

	describe "#toggle_favorite" do
  	it 'should change the favorite boolean to its opposite' do
  		task = Task.new(favorite: true)
  		task.toggle_favorite!
  		expect(task.favorite).to eq(false)
  	end
	end

	describe "#overdue" do
  	it 'should tell you the time is not past the deadline' do
  		task = Task.new(deadline: Time.now + 1.hour)
  		expect(task.overdue?).to eq(false)
  	end
		it 'should tell you the time is past the deadline' do
  		task = Task.new(deadline: Time.now - 1.hour)
  		expect(task.overdue?).to eq(true)
  	end
	end

	describe "#increment_priority" do
  	it 'should increment the priority by 1' do
  		task = Task.new(priority: 5)
  		task.increment_priority!
  		expect(task.priority).to eq(6)
  	end
		it 'should not increment the priority by 1' do
  		task = Task.new(priority: 10)
  		task.increment_priority!
  		expect(task.priority).to eq(10)
  	end
	end

	
	describe "#decrement_priority" do
  	it 'should decrement the priority by 1' do
  		task = Task.new(priority: 5)
  		task.decrement_priority!
  		expect(task.priority).to eq(4)
  	end
		it 'should not decrement the priority by 1' do
  		task = Task.new(priority: 1)
  		task.decrement_priority!
  		expect(task.priority).to eq(1)
  	end
	end

	
	describe "#snooze_hour" do
  	it 'should add an hour to the deadline' do
  		task = Task.new(deadline: Time.now)
  		new_deadline = task.deadline + 1.hour
  		task.snooze_hour!
  		expect(task.deadline).to eq(new_deadline)
  	end
	end
	

end