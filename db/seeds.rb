3.times { Task.create!(title: 'Sample Task') }
2.times { Task.create!(title: 'Sample Task', is_done: true) }
