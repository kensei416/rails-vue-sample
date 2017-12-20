3.times { Task.create!(title: 'Sample Task', category: 'family') }
2.times { Task.create!(title: 'Sample Task', is_done: true, category: 'family' ) }
